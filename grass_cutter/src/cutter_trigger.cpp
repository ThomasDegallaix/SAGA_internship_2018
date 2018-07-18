#include "ros/ros.h"
#include "std_msgs/String.h"
#include <cstring>
#include <cstdlib>
#include <std_srvs/Trigger.h>

using namespace std;

//This service make the user able to change the height of the grass cutter

int main(int argc, char **argv) {

ros::init(argc, argv, "cutter_trigger");

ros::NodeHandle nh;
ros::ServiceClient triggerMODEPlus = nh.serviceClient<std_srvs::Trigger>("cutter_MODEPlus");
ros::ServiceClient triggerMODEMinus = nh.serviceClient<std_srvs::Trigger>("cutter_MODEMinus");
ros::ServiceClient triggerONOFF = nh.serviceClient<std_srvs::Trigger>("system_ONOFF");
ros::ServiceClient triggerCutterONOFF = nh.serviceClient<std_srvs::Trigger>("cutter_ONOFF");

std_srvs::Trigger triggerSrv;

if(triggerMODEPlus.call(triggerSrv) || triggerMODEMinus.call(triggerSrv) || triggerONOFF.call(triggerSrv) || triggerCutterONOFF.call(triggerSrv)) {
	ROS_INFO("ACK: %s", triggerSrv.response.message.c_str());

}
else {
	ROS_INFO("Failed to call trigger service");
}

ros::spin();

return 0;

}
