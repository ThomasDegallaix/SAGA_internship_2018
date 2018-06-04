#include "ros/ros.h"
#include <thorvald_sprayer/CANFrame.h>
#include <thorvald_sprayer/sprayer_controller.h>
#include "std_msgs/String.h"
#include <cstring>
#include <cstdlib>


using namespace std;

/*Global variable which stores the address of the service in order to use it in the subscriber callback*/
ros::ServiceClient *clientPtr;


void getServiceCB(thorvald_sprayer::sprayer_controller srv) {
  if (clientPtr->call(srv)) {
    ROS_INFO("ACK: %s", srv.response.message.c_str());
    exit(EXIT_SUCCESS);
  }
  else {
    ROS_ERROR("Failed to call service");
    exit(EXIT_FAILURE);
  }
}


/*Callback which check the state of the pump by subscribing to the data feedback and ask to the server for a specific action in consequence*/
void statusCallback(const thorvald_sprayer::CANFrame::ConstPtr &msg) {

  thorvald_sprayer::sprayer_controller srv;
  int status = (int)msg->data[4];

  if (status == 1) {
    ROS_INFO("Sending MODE1 request...");
    srv.request.nodeID = 5;
    srv.request.order = "MODE1";
    getServiceCB(srv);
  }
  else if (status == 2) {
    ROS_INFO("Sending MODE2 request...");
    srv.request.nodeID = 5;
    srv.request.order = "MODE2";
    getServiceCB(srv);
  }
  else if (status == 3) {
    ROS_INFO("Sending MODE3 request...");
    srv.request.nodeID = 5;
    srv.request.order = "MODE3";
    getServiceCB(srv);
  }
  else if (status == 4) {
    ROS_INFO("Sending MODE4 request...");
    srv.request.nodeID = 5;
    srv.request.order = "MODE4";
    getServiceCB(srv);
  }
  else if (status == 5) {
    ROS_INFO("Sending MODE5 request...");
    srv.request.nodeID = 5;
    srv.request.order = "MODE5";
    getServiceCB(srv);
  }
  else if (status == 6) {
    ROS_INFO("Sending MODE6 request...");
    srv.request.nodeID = 5;
    srv.request.order = "MODE6";
    getServiceCB(srv);
  }
  else if (status == 7) {
    ROS_INFO("Sending MODE7 request...");
    srv.request.nodeID = 5;
    srv.request.order = "MODE7";
    getServiceCB(srv);
  }
  else if (status == 8) {
    ROS_INFO("Sending MODE8 request...");
    srv.request.nodeID = 5;
    srv.request.order = "MODE8";
    getServiceCB(srv);
  }
  else if (status == 9) {
    ROS_INFO("Sending MODE9 request...");
    srv.request.nodeID = 5;
    srv.request.order = "MODE9";
    getServiceCB(srv);
  }
  else {
    ROS_ERROR("The pump is currently stopped, start it to proceed any mode");
    exit(EXIT_FAILURE);
  }
}




/*This service was designed to allow the user to change the motor speed of the pump*/
int main(int argc, char **argv) {

  ros::init(argc,argv,"sprayer_controller_v3");

  ros::NodeHandle nh;
  ros::ServiceClient client = nh.serviceClient<thorvald_sprayer::sprayer_controller>("sprayer_controller");

  clientPtr = &client;

  ros::Subscriber sub = nh.subscribe("/can_frames_device_r",1000,&statusCallback);

  ros::spin();

  return 0;
}
