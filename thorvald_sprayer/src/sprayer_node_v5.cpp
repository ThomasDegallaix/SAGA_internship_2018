#include "ros/ros.h"
#include <thorvald_sprayer/CANFrame.h>
#include <thorvald_sprayer/sprayer_controller.h>
#include "std_msgs/String.h"
#include <cstring>


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
    pub_ = n_.advertise<thorvald_sprayer::CANFrame>("/can_frames_device_t",1000);
    ss_ = n_.advertiseService("sprayer_controller",&ThorvaldSprayer::onOffCallback,this);
  }

  /* Getters and Setters */
  Request getRequest() const { return onOffRequest; };
  ros::Publisher getPublisher() const { return pub_; };
  thorvald_sprayer::CANFrame getMsg() { return msg; };

  void setMsg(int rpdo, int node_id, int var_1, int var_2);


  /* class member functions */

  void process_data(Request request);
  void display_infos(thorvald_sprayer::CANFrame msg, int count, Request request);

  /*callback for the service client*/
  bool onOffCallback(thorvald_sprayer::sprayer_controller::Request &req, thorvald_sprayer::sprayer_controller::Response &res) {

    onOffRequest.order = req.order.c_str();
    onOffRequest.nodeID = req.nodeID;

    if(strcmp(req.order.c_str(),"ON") == 0) {
      res.message = "ON request has been given";
    }
    else if(strcmp(req.order.c_str(),"OFF") == 0) {
      res.message = "OFF request has been given";
    }
    else {
      res.message = "ERR: Request not recognised";
    }
    return true;
  }


  /* Callback for the pressure enslavement */
  //TODO


private:

  /*Start the node*/
  ros::NodeHandle n_;

  ros::Publisher pub_; //TO USE
  ros::Subscriber sub_;
  ros::ServiceServer ss_;

  thorvald_sprayer::CANFrame msg;
  Request onOffRequest;
  bool tankIsEmpty;

};



/*##########################################  CLASS MEMBER FUNCTION ##########################################*/


/*Function used to fulfill the message*/
/*Each element of msg.data correspond to a variable used by the motor controller from VAR_9 to VAR_16, cf Roboteq's user manual*/
void ThorvaldSprayer::setMsg(int rpdo, int node_id, int var_1, int var_2) {
  msg.can_id = rpdo + node_id;

  /*Initialing the array of data*/
  for(int i=0;i<8;i++) {
    msg.data[i] = 0;
  }

  switch(rpdo) {
    case 0x200 : {  msg.data[0] = var_1;
                    msg.data[1] = var_2;
                    break;
                 }
    case 0x300 : {  msg.data[2] = var_1;
                    msg.data[3] = var_2;
                    break;
                 }
    case 0x400 : {  msg.data[4] = var_1;
                    msg.data[5] = var_2;
                    break;
                 }
    case 0x500 : {  msg.data[6] = var_1;
                    msg.data[7] = var_2;
                    break;
                 }
    default : ROS_ERROR("The requested RPDO doesn't exist");
              break;
  }

  msg.length = sizeof(msg.data)/sizeof(msg.data[0]);
}



/*Function used to create the correct message according to the action asked by the user*/
void ThorvaldSprayer::process_data(Request request) {

  if(strcmp(request.order.c_str(),"ON") == 0) {
    setMsg(rpdo1,request.nodeID,1,0);
  }
  else if(strcmp(request.order.c_str(),"OFF") == 0) {
    setMsg(rpdo1,request.nodeID,0,0);
  }
  else{
    ROS_WARN("/!\\ Doesn't know which action has to be performed /!\\");
  }
}


/*Simple procedure which displays some informations*/
void ThorvaldSprayer::display_infos(thorvald_sprayer::CANFrame msg, int count, Request request) {
  /*Display infos*/
  if(request.order.c_str() == "ON" || "OFF") {
    ROS_INFO("#%d Sending data to RPDO1", count);
  }
  else{
    ROS_INFO("#%d RPDO not implemented yet", count);
  }
  ROS_INFO("ID: %d", msg.can_id);
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

    //ROS_INFO("#%d %s\n", count, sprayer.getRequest().order.c_str());

    sprayer.process_data(sprayer.getRequest());
    sprayer.display_infos(sprayer.getMsg(), count, sprayer.getRequest());

    sprayer.getPublisher().publish(sprayer.getMsg());


    ros::spinOnce();

    loop_rate.sleep();
    count++;

  }

  return 0;
}
