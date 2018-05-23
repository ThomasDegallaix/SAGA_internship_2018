#include "ros/ros.h"
#include <thorvald_sprayer/sprayer_controller.h>

using namespace std;

/*This service was designed to allow the user to start and stop the pump*/
int main(int argc, char **argv) {

  ros::init(argc,argv,"sprayer_controller_v2");

  if(argc != 3 || strcmp(argv[2],"ON") != 0 && strcmp(argv[2],"OFF") != 0) {
    ROS_WARN("Usage: [node ID] [Action to perform]");
    ROS_WARN("Action to perform: \n    - [ON]\n    - [OFF]\n");
    return 1;
  }

  ros::NodeHandle nh;
  ros::ServiceClient client = nh.serviceClient<thorvald_sprayer::sprayer_controller>("sprayer_controller");

  thorvald_sprayer::sprayer_controller srv;

  srv.request.nodeID = atoi(argv[1]);
  srv.request.order = argv[2];
  ROS_INFO("Sending %s request...", argv[2]);

  if (client.call(srv)) {
    ROS_INFO("ACK: %s", srv.response.message.c_str());
  }
  else {
    ROS_ERROR("Failed to call service");
    return 1;
  }

  return 0;
}
