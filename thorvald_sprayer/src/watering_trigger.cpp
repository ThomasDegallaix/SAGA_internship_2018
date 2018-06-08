#include "ros/ros.h"
#include "std_msgs/String.h"
#include <cstring>
#include <cstdlib>
#include <std_srvs/Trigger.h>


using namespace std;


/*This service was designed to allow the user to change the motorspeed of the pump with the xbox controller*/
int main(int argc, char **argv) {

  ros::init(argc,argv,"watering_trigger");

  ros::NodeHandle nh;
  ros::ServiceClient trigger = nh.serviceClient<std_srvs::Trigger>("watering");

  std_srvs::Trigger triggerSrv;

  if (trigger.call(triggerSrv)) {
    ROS_INFO("ACK: %s", triggerSrv.response.message.c_str());
  }
  else {
    ROS_ERROR("Failed to call trigger service");
  }

  ros::spin();

  return 0;
}
