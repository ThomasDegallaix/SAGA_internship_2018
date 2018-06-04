#include "ros/ros.h"
#include "std_msgs/String.h"
#include <cstring>
#include <cstdlib>
#include <std_srvs/Trigger.h>


using namespace std;


/*This service was designed to allow the user to stop or start the pump with the xbox controller*/
int main(int argc, char **argv) {

  ros::init(argc,argv,"sprayer_MODE");

  ros::NodeHandle nh;
  ros::ServiceClient triggerClient = nh.serviceClient<std_srvs::Trigger>("sprayer_MODE");

  std_srvs::Trigger triggerSrv;

  if (triggerClient.call(triggerSrv)) {
    ROS_INFO("ACK: %s", triggerSrv.response.message.c_str());
  }
  else {
    ROS_ERROR("Failed to call trigger service");
  }

  ros::spin();

  return 0;
}
