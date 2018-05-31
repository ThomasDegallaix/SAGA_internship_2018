#include "ros/ros.h"
#include <thorvald_sprayer/CANFrame.h>
#include <thorvald_sprayer/sprayer_controller.h>
#include "std_msgs/String.h"
#include <cstring>
#include <cstdlib>


using namespace std;

/*Variable store the address of the service in order to use it in the subscriber callback*/
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

/*Callback which check the state of the pump by subscribing to the data feedback and ask to the server to start or shutdown the pump*/
void statusCallback(const thorvald_sprayer::CANFrame &msg) {

  thorvald_sprayer::sprayer_controller srv;
  int status = (int)msg.data[4];

  if (status == 0) {
    ROS_INFO("Sending ON request...");
    srv.request.nodeID = 5;
    srv.request.order = "ON";
    getServiceCB(srv);
  }
  else {
    ROS_INFO("Sending OFF request...");
    srv.request.nodeID = 5;
    srv.request.order = "OFF";
    getServiceCB(srv);
  }
}

/*This service was designed to allow the user to change the motor speed of the pump*/
int main(int argc, char **argv) {

  ros::init(argc,argv,"sprayer_ONOFF_v1");

  ros::NodeHandle nh;
  ros::ServiceClient client = nh.serviceClient<thorvald_sprayer::sprayer_controller>("sprayer_ONOFF");

  clientPtr = &client;

  ros::Subscriber sub = nh.subscribe("/can_frames_device_r",1000,&statusCallback);

  ros::spin();

  return 0;
}
