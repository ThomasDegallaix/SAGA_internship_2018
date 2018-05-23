#include "ros/ros.h"
#include <thorvald_sprayer/sprayer_controller.h>

using namespace std;

int main(int argc, char **argv) {

  ros::init(argc,argv,"sprayer_controller_v1");

  if(argc != 3 ) {
    ROS_WARN("Usage: [node ID] [Action to perform]");
    ROS_WARN("Action to perform: \n    - [init]\n    - [run]\n    - [break]\r");
    return 1;
  }

  ros::NodeHandle nh;
  ros::ServiceClient client = nh.serviceClient<thorvald_sprayer::sprayer_controller>("sprayer_controller");

  thorvald_sprayer::sprayer_controller srv;

  srv.request.nodeID = atoi(argv[1]);
  srv.request.order = argv[2];
  ROS_INFO("Sending %s order...", argv[1]);

  if (client.call(srv)) {
    ROS_INFO("ACK: %s", srv.response.message.c_str());
  }
  else {
    ROS_ERROR("Failed to call service");
    return 1;
  }

  return 0;
}
