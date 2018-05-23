#include "ros/ros.h"
#include <thorvald_sprayer/CANFrame.h>
#include <thorvald_sprayer/sprayer_controller.h>
#include "std_msgs/String.h"
#include <cstring>

//https://github.com/g/roboteq

using namespace std;

/*Structure used to store the service request*/
struct Request {
  string order;
  int nodeID;
} request;

/*List of used TPDO, for more informations look at the roboteq datasheet*/
enum RPDO {rpdo1=0x200,rpdo2=0x300};

/*Procedure used to have access to the content of the service request*/
void getRequest(Request *request, thorvald_sprayer::sprayer_controller::Request req) {
  request->order = req.order.c_str();
  request->nodeID = req.nodeID;
}

/*callback for the service client*/
bool serviceCallback(thorvald_sprayer::sprayer_controller::Request &req, thorvald_sprayer::sprayer_controller::Response &res) {
  getRequest(&request,req);
  if(strcmp(req.order.c_str(),"init") == 0) {
    res.message = "Init order was given";
  }
  else if(strcmp(req.order.c_str(),"run") == 0) {
    res.message = "Run order was given";
  }
  else if(strcmp(req.order.c_str(),"break") == 0) {
    res.message = "Break order was given";
  }
  else {
    res.message = "ERR: Something went wrong with the order !";
  }
  return true;
}


/*Function used to fulfill the message*/
thorvald_sprayer::CANFrame fulfill_message(thorvald_sprayer::CANFrame *msg, int rpdo, int node_id, int var_1, int var_2) {

  msg->can_id = rpdo + node_id;

  /*Initialing the data array*/
  for(int i=0;i<8;i++) {
    msg->data[i] = 0;
  }
  msg->data[0] = var_1;
  msg->data[3] = var_2;
  msg->length = 8;

  return *msg;
}

/*Function used to create the correct message according to the action asked by the user*/
thorvald_sprayer::CANFrame process_data(thorvald_sprayer::CANFrame *msg, RPDO rpdo, Request request, char** argv) {

  if(strcmp(request.order.c_str(),"init") == 0) {
    fulfill_message(msg,rpdo,request.nodeID,1,0);
  }
  else if(strcmp(request.order.c_str(),"run") == 0) {
    fulfill_message(msg,rpdo,request.nodeID,2,0);
  }
  else if(strcmp(request.order.c_str(),"break") == 0) {
    fulfill_message(msg,rpdo,request.nodeID,0,1);
  }
  else{
    ROS_WARN("/!\\ Doesn't know which action has to be performed /!\\");
  }

  return *msg;
}

/*Simple procedure which displays some informations*/
void display_infos(thorvald_sprayer::CANFrame *msg, int count, Request request) {
  /*Display infos*/
  if(request.order.c_str() == "init" || "run" || "break") {
    ROS_INFO("#%d Sending data to RPDO1", count);
  }
  else{
    ROS_INFO("#%d Sending data to RPDO2", count);
  }
  ROS_INFO("ID: %d", msg->can_id);
  ROS_INFO("Length: %d", msg->length);
  ROS_INFO("Data: [%d,%d]", msg->data[0], msg->data[4]);
}


int main(int argc, char **argv) {

  /*Initializing the node*/
  ros::init(argc,argv,"sprayer_node_v3");

  /*Start the node*/
  ros::NodeHandle nh;

  ros::ServiceServer serviceServer = nh.advertiseService("sprayer_controller",serviceCallback);
  ros::Publisher sprayer_pub = nh.advertise<thorvald_sprayer::CANFrame>("/can_frames_device_t",1000);

  /*Sleep at a rate of 1Hz*/
  ros::Rate loop_rate(1);

  int count = 0;
  while(ros::ok()) {

    /*Instantiate a new message*/
    thorvald_sprayer::CANFrame msg;

    RPDO rpdo;
    /*What RPDO are we using ?*/
    request.order.c_str() == "init" || "run" || "break" ? rpdo=rpdo1 : rpdo=rpdo2;

    process_data(&msg, rpdo, request, argv);
    display_infos(&msg, count, request);

    sprayer_pub.publish(msg);

    ros::spinOnce();

    loop_rate.sleep();
    count++;

  }

  return 0;
}
