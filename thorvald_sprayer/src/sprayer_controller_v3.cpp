#include "ros/ros.h"
#include <thorvald_sprayer/CANFrame.h>
#include <thorvald_sprayer/sprayer_controller.h>
#include "std_msgs/String.h"
#include <cstring>
#include <cstdlib>


using namespace std;

ros::ServiceClient *clientPtr;

void statusCallback(const thorvald_sprayer::CANFrame &msg) {

  thorvald_sprayer::sprayer_controller srv;
  int status = (int)msg.data[0];


  if (status == 1) {
    ROS_INFO("Sending ON request...");
    srv.request.nodeID = 5;
    srv.request.order = "ON";

    if (clientPtr->call(srv)) {
      ROS_INFO("ACK: %s", srv.response.message.c_str());
      exit(EXIT_SUCCESS);
    }
    else {
      ROS_ERROR("Failed to call service");
      exit(EXIT_FAILURE);
    }
  }
  else {
    ROS_ERROR("No modes have been found");
    exit(EXIT_FAILURE);
  }
}



/*This service was designed to allow the user to start and stop the pump*/
int main(int argc, char **argv) {

  ros::init(argc,argv,"sprayer_controller_v3");

  ros::NodeHandle nh;
  ros::ServiceClient client = nh.serviceClient<thorvald_sprayer::sprayer_controller>("sprayer_controller");

  clientPtr = &client;

  ros::Subscriber sub = nh.subscribe("/can_frames_device_r",1000,&statusCallback);

  ros::spin();

  return 0;
}
