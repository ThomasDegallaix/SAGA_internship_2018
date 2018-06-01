#include "ros/ros.h"
#include <thorvald_sprayer/CANFrame.h>
#include <thorvald_sprayer/sprayer_controller.h>
#include "commands.h"
#include <cstring>
#include "std_msgs/String.h"



#define DESIRED_PRESSURE 3000

using namespace std;

/*List of used TPDO, for more informations look at the roboteq datasheet*/
enum RPDO {rpdo1=0x200,rpdo2=0x300,rpdo3=0x400,rpdo4=0x500};

/*Structure used to store the service request*/
struct Request {
  string order;
  int nodeID;
};



/*##########################################  DECLARATION OF THE CLASS ##########################################*/

class ThorvaldSprayer {

public:

  /* Constructor */
  ThorvaldSprayer() {

    /*Initialing the array of data*/
    for(int i=0;i<8;i++) {
      msg.data.push_back(0);
    }
    pub_ = n_.advertise<thorvald_sprayer::CANFrame>("/can_frames_device_t",1000);
    ss_mode = n_.advertiseService("sprayer_controller",&ThorvaldSprayer::serviceCallback,this);
    ss_onoff = n_.advertiseService("sprayer_ONOFF",&ThorvaldSprayer::serviceCallback,this);
    sub_ = n_.subscribe("/can_frames_device_r",1000,&ThorvaldSprayer::feedBack,this);
  }

  /* Getters and Setters */
  Request getRequest() const { return serviceRequest; };
  ros::Publisher getPublisher() const { return pub_; };
  thorvald_sprayer::CANFrame getMsg() { return msg; };
  int getPressure() { return pressure; };
  void setMsg(int node_id, const string command[9]);


  /* class member functions */

  void process_data(Request request);
  void display_infos(thorvald_sprayer::CANFrame msg, int count, Request request);

  /*callback for the service client, stores the request into class variables used to send commands to the pump*/
  bool serviceCallback(thorvald_sprayer::sprayer_controller::Request &req, thorvald_sprayer::sprayer_controller::Response &res) {

    serviceRequest.order = req.order.c_str();
    serviceRequest.nodeID = req.nodeID;

    if(strcmp(req.order.c_str(),"ON") == 0) {
      res.message = "ON request has been given";
    }
    else if(strcmp(req.order.c_str(),"MODE1") == 0) {
      res.message = "MODE1 request has been given";
    }
    else if(strcmp(req.order.c_str(),"MODE2") == 0) {
      res.message = "MODE2 request has been given";
    }
    else if(strcmp(req.order.c_str(),"MODE3") == 0) {
      res.message = "MODE3 request has been given";
    }
    else if(strcmp(req.order.c_str(),"MODE4") == 0) {
      res.message = "MODE4 request has been given";
    }
    else if(strcmp(req.order.c_str(),"MODE5") == 0) {
      res.message = "MODE5 request has been given";
    }
    else if(strcmp(req.order.c_str(),"MODE6") == 0) {
      res.message = "MODE6 request has been given";
    }
    else if(strcmp(req.order.c_str(),"MODE7") == 0) {
      res.message = "MODE7 request has been given";
    }
    else if(strcmp(req.order.c_str(),"MODE8") == 0) {
      res.message = "MODE8 request has been given";
    }
    else if(strcmp(req.order.c_str(),"MODE9") == 0) {
      res.message = "MODE9 request has been given";
    }
    else if(strcmp(req.order.c_str(),"OFF") == 0) {
      res.message = "OFF request has been given";
    }
    else {
      res.message = "ERR: Request not recognised";
    }
    return true;
  }

  


  /* Callback for the feedback */
  void feedBack(const thorvald_sprayer::CANFrame &fb) {
    ROS_INFO("ID : %d\n", fb.id);
    //pump_status = fb.data[5];
    pressure = fb.data[0] + pow(2,8)*fb.data[1];
  }


  /* Callback for the pressure enslavement */
  /*
  void pressureEnslavement(thorvald_sprayer::feedbackData fb) {

    pressure = fb.pressure;
    ROS_ERROR("Pression fb %d\n", fb.pressure);
    ROS_ERROR("Pression classe %d\n", pressure);
    ROS_ERROR("Vitesse moteur %d\n", motorSpeed);
    if(pressure < DESIRED_PRESSURE){
      motorSpeed += 50; //valeur a pif a modifier
      if(motorSpeed < 0){
        motorSpeed = 0;
      }
    }
    else if(pressure >= DESIRED_PRESSURE){
      motorSpeed -= 50; //valeur a pif a modifier
      if(motorSpeed > 1200){
        motorSpeed = 1200;
      } //mettre vitesse max du moteur
    }
    ROS_ERROR("Nouvelle vitesse moteur %d\n", motorSpeed);
  }
  */


private:

  /*Start the node*/
  ros::NodeHandle n_;

  ros::Publisher pub_;
  ros::Subscriber sub_;
  ros::ServiceServer ss_mode;
  ros::ServiceServer ss_onoff;

  thorvald_sprayer::CANFrame msg;
  Request serviceRequest;

  bool tankIsEmpty;
  int pressure;
};



/*##########################################  CLASS MEMBER FUNCTION ##########################################*/


/*Function used to fulfill the message*/
void ThorvaldSprayer::setMsg(int node_id, const string command[9]) {

  int rpdo = 0;

  if (command[0] == "rpdo1") { rpdo = rpdo1; }
  else if (command[0] == "rpdo2") { rpdo = rpdo2; }
  else if (command[0] == "rpdo3") { rpdo = rpdo3; }
  else if (command[0] == "rpdo4") { rpdo = rpdo4; }
  else {
    ROS_ERROR("Something is wrong with the RPDO used by the command");
  }

  msg.id = rpdo + node_id;

  for(int i = 1; i < 9; i++) {
    msg.data[i-1] = atoi(command[i].c_str());
  }

  msg.length = 8;
}



/*Function used to create the correct message according to the action asked by the user*/
void ThorvaldSprayer::process_data(Request request) {

  if(strcmp(request.order.c_str(),"ON") == 0) {
    setMsg(request.nodeID,commands::ON);
  }
  else if(strcmp(request.order.c_str(),"MODE1") == 0) {
    setMsg(request.nodeID,commands::MODE1);
  }
  else if(strcmp(request.order.c_str(),"MODE2") == 0) {
    setMsg(request.nodeID,commands::MODE2);
  }
  else if(strcmp(request.order.c_str(),"MODE3") == 0) {
    setMsg(request.nodeID,commands::MODE3);
  }
  else if(strcmp(request.order.c_str(),"MODE4") == 0) {
    setMsg(request.nodeID,commands::MODE4);
  }
  else if(strcmp(request.order.c_str(),"MODE5") == 0) {
    setMsg(request.nodeID,commands::MODE5);
  }
  else if(strcmp(request.order.c_str(),"MODE6") == 0) {
    setMsg(request.nodeID,commands::MODE6);
  }
  else if(strcmp(request.order.c_str(),"MODE7") == 0) {
    setMsg(request.nodeID,commands::MODE7);
  }
  else if(strcmp(request.order.c_str(),"MODE8") == 0) {
    setMsg(request.nodeID,commands::MODE8);
  }
  else if(strcmp(request.order.c_str(),"MODE9") == 0) {
    setMsg(request.nodeID,commands::MODE9);
  }
  else if(strcmp(request.order.c_str(),"OFF") == 0) {
    setMsg(request.nodeID,commands::OFF);
  }
  else{
    ROS_WARN("/!\\ Doesn't know which action has to be performed /!\\");
  }
}


/*Simple procedure which displays some informations*/
void ThorvaldSprayer::display_infos(thorvald_sprayer::CANFrame msg, int count, Request request) {
  /*Display infos*/
  if(request.order.c_str() != NULL) {
    ROS_INFO("#%d Sending data to RPDO1", count);
  }
  else{
    ROS_INFO("#%d RPDO not implemented yet", count);
  }
  ROS_INFO("ID: %d", msg.id);
  ROS_INFO("Length: %d", msg.length);
  ROS_INFO("Data: [%d,%d,%d,%d,%d,%d,%d,%d]", msg.data[0], msg.data[1], msg.data[2], msg.data[3], msg.data[4], msg.data[5], msg.data[6], msg.data[7]);
}




/*##########################################  MAIN  ##########################################*/


int main(int argc, char **argv) {

  /*Initializing the node*/
  ros::init(argc,argv,"sprayer_node_v5");

  ThorvaldSprayer sprayer;

  /*Sleep at a rate of 1Hz*/
  ros::Rate loop_rate(1);

  int count = 0;
  while(ros::ok()) {

    sprayer.process_data(sprayer.getRequest());
    sprayer.display_infos(sprayer.getMsg(), count, sprayer.getRequest());

    sprayer.getPublisher().publish(sprayer.getMsg());


    ros::spinOnce();

    loop_rate.sleep();
    count++;

  }

  return 0;
}
