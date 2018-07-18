#include "ros/ros.h"
#include "std_msgs/String.h"
#include <grass_cutter/CANFrame.h>
#include <sstream>
#include <bitset>
#include "commands.h"
#include <cstring>
#include <std_srvs/Trigger.h>

#define NODE_ID 5


using namespace std;


enum RPDO {rpdo1 = 0x200, rpdo2 = 0x300, rpdo3 = 0x400, rpdo4 = 0x500};


struct Request {		//struct used to store the service request
	string state;
	int mode;
};



class GrassCutter
{


public:                  //constructor et methods
GrassCutter(){

	//Set the array of data that we are going to use
	for (int i = 0; i<8; i++) {
	msg.data.push_back(0);	
	}
	serviceRequest.state = "systemOFF";
	serviceRequest.mode = 1;
	


	pub_ = n_.advertise<grass_cutter::CANFrame>("/can_frame_device_t", 1000);
	sub_cylinder = n_.subscribe("/can_frame_device_r", 1000, &GrassCutter::cylinderFeedback,this);
	ss_modePlus = n_.advertiseService("cutter_MODEPlus",&GrassCutter::modeCallbackPlus,this);
	ss_modeMinus = n_.advertiseService("cutter_MODEMinus",&GrassCutter::modeCallbackMinus,this);
        ss_onoff = n_.advertiseService("system_ONOFF",&GrassCutter::onoffCallback,this);
	ss_cutteronoff = n_.advertiseService("cutter_ONOFF",&GrassCutter::cutter_power,this);

}



~GrassCutter(void){		//destructor
}




//Getters and Setters
Request getRequest() const { return serviceRequest; };
ros::Publisher getPublisher() const { return pub_;};
grass_cutter::CANFrame getMsg() { return msg; };
int getCylinderPosition() { return cylinderPosition; };
void setMsg(const string command[9]);




void process_data(Request request);
void display_infos(grass_cutter::CANFrame msg, int count, Request request);
int* decToBinary(int dec, int binary[8]);



bool cutter_power(std_srvs::Trigger::Request &req, std_srvs::Trigger::Response &res) {  //function used to turn on the cutter, only if the system is already turned on
	res.message = true;
	res.message = "Command for powering on the cutter";
	if ((systemStatus > 0) && (msg.data[1] == 0)) {
		ROS_INFO("Sending on request for powering on the cutter");
		serviceRequest.state = "cutterON";
		msg.data[1] = 1;
	} 
	else if ((systemStatus > 0) && (msg.data[1] == 1)) {
		msg.data[1] = 0;
		ROS_INFO("Cutter turned off");
		serviceRequest.state = "cutterOFF";
	}
	else {
		ROS_INFO("You need to turn on the system before powering on the cutter. Be careful");	
	}
}

//callback used to trigger commands with the xbox controller
bool onoffCallback(std_srvs::Trigger::Request &req, std_srvs::Trigger::Response &res) {
	res.success = true;
	res.message = "Trigger command for starting/stopping the cutting system and hydraulic cylinder sent";
	if(systemStatus == 0) {
		ROS_INFO("Sending ON request\n");
		serviceRequest.state = "systemON";
		serviceRequest.mode = 1;
		systemStatus = 1;	
	}
	else if (systemStatus == 1) {
		ROS_INFO("Sending OFF request\n");
		serviceRequest.state = "systemOFF";
		serviceRequest.mode = 0;
		systemStatus = 0;
	}

	return true;

}


bool modeCallbackPlus(std_srvs::Trigger::Request &req, std_srvs::Trigger::Response &res) {
	res.success = true;
	res.message = "Trigger command for operating the whole cutter system";

	if (systemStatus == 0) {
		ROS_WARN("You need to turn on the grass cutter system before choosing a mode and power on the cutter");
	}
	else if (systemStatus == 1 && serviceRequest.mode == 1){	//low cutting height
		serviceRequest.mode++;
	}
	else if (systemStatus == 2 && serviceRequest.mode == 2){	//medium cutting height
		serviceRequest.mode++;
	}
	else if (systemStatus == 3 && serviceRequest.mode == 3){	
		ROS_INFO("You are already at the highest cutting height");;
	}
}

bool modeCallbackMinus(std_srvs::Trigger::Request &req, std_srvs::Trigger::Response &res) {
	res.success = true;
	res.message = "Trigger command for operating the whole cutter system";

	if (systemStatus == 0) {
		ROS_WARN("You need to turn on the grass cutter system before choosing a mode and power on the cutter");
	}
	else if (systemStatus == 3 && serviceRequest.mode == 3){	//high cutting height
		serviceRequest.mode--;
	}
	else if (systemStatus == 2 && serviceRequest.mode == 2){	//medium cutting height
		serviceRequest.mode--;
	}
	else if (systemStatus == 1 && serviceRequest.mode == 1){	
		ROS_INFO("You are already at the lowest cutting height");;
	}
}


//Feedback function for the Hydraulic cylinder feedback of the grass cutter
void cylinderFeedback(const grass_cutter::CANFrame &fb)
{
	if(fb.id == 389) {
		cylinderPosition = 0;
		systemStatus = fb.data[4];
		
		int binary[8];
		decToBinary(fb.data[1],binary);
		for (int i = 0; i < 8; i++) {
			cylinderPosition += (double)binary[i]*pow(2,15-i);
		}
		cylinderPosition += (double)fb.data[0];
		
		//We receive an analogic value from about 530 mV to 5300 mV. So we have a range of 4770 mV. We need to measure the max amplitude of height of the grass cutter while all is installed on the robot, in order to establish a mapping of the analogic value on the grass cutter height.
	}
	

}


private: 

  ros::NodeHandle n_;
  
  ros::Publisher pub_;
  ros::Subscriber sub_cylinder;
  ros::ServiceServer ss_modePlus;
  ros::ServiceServer ss_modeMinus;
  ros::ServiceServer ss_onoff;
  ros::ServiceServer ss_cutteronoff;
  
  grass_cutter::CANFrame msg;
  Request serviceRequest;
  int systemStatus = 0;

  double cylinderPosition;
  

}; //end of the class


//CLASS MEMBER FUNCTIONS




//function to fullfill the message
void GrassCutter::setMsg(const string command[9]){
	int rpdo = 0;
	
	if (command[0] == "rpdo1") { rpdo = rpdo1; }
	else if (command[0] == "rpdo2") { rpdo = rpdo2; }
	else if (command[0] == "rpdo3") { rpdo = rpdo3; }
	else if (command[0] == "rpdo4") { rpdo = rpdo4; }
	else {
		ROS_ERROR("Something is wrong with the RPDO used by the command");	
	}
	
	msg.id = rpdo + NODE_ID;

	if(serviceRequest.mode > 1) {
		msg.data[0] = serviceRequest.mode;
		for (int j = 2; j < 9; j++) {
			msg.data[j] = 0;		
		}
	}
	
	else {
		for (int i = 1; i < 9; i++) {
			msg.data[i-1] = atoi(command[i].c_str());
		}
	}

	msg.length = 8;

}
/*Function used to create some messages asked by the user  turn on or off the system and the cutter*/
void GrassCutter::process_data(Request request){
	if(strcmp(request.state.c_str(), "systemON") == 0){	//turn on the system
		setMsg(commands::systemON);
	}
	
	else if(strcmp(request.state.c_str(), "systemOFF") == 0){	//turn off the system
		setMsg(commands::systemOFF);
	}
	else if(strcmp(request.state.c_str(), "cutterON") == 0){	//turn on the cutter
		setMsg(commands::cutterON);
	}

	else{
		ROS_WARN("/!\\ Doesn't know which action to perform /!\\");
	}
} 



//conversion from decimal to binary

int* GrassCutter::decToBinary(int dec, int binary[8]) {
	string binarystr = bitset<8>(dec).to_string();
	for(int i = 0; i<binarystr.length(); i++) {
		if(binarystr[i] == 48) { 	//ASSCII value for binary '0'
			binary[i] = 0;
		}
		else if(binarystr[i] == 49){ 	//ASCII value for binary '1' 
			binary[i] = 1;
		}
	}
	return binary;
}



//procedure which display some informations
void GrassCutter::display_infos(grass_cutter::CANFrame msg, int count, Request request) {
	if (request.state.c_str() != NULL) {
		ROS_INFO("#%d Sending data to RPDO1", count);
	}
	else {
		ROS_INFO("#%d RPDO not implemented yet", count);
	}
	ROS_INFO("ID: %d", msg.id);
	ROS_INFO("Length: %d", msg.length);
	ROS_INFO("Data: [%d, %d, %d, %d, %d, %d, %d, %d]", msg.data[0], msg.data[1],msg.data[2], msg.data[3], msg.data[4], msg.data[5], msg.data[6], msg.data[7]);

}


int main(int argc, char **argv) {


ros::init(argc, argv, "grass_cutter_node");

GrassCutter cutter;

ros::Rate loop_rate(10);

int count = 0;
while (ros::ok()) {
  
  cutter.process_data(cutter.getRequest());
  cutter.display_infos(cutter.getMsg(),count, cutter.getRequest());
  cutter.getPublisher().publish(cutter.getMsg());

  ros::spinOnce();

  loop_rate.sleep();
  ++count;
  }



return 0;
}

//http://wiki.ros.org/ROS/Tutorials/WritingPublisherSubscriber%28c%2B%2B%29
