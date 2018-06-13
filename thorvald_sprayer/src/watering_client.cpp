#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <actionlib/client/terminal_state.h>
#include <thorvald_sprayer/WateringAction.h>
#include <boost/thread.hpp>

#define OPEN_FLOW 363.0 //The pump can deliver this flow when there is no nozzles
#define VOLUME 3.0

// http://wiki.ros.org/actionlib_tutorials/Tutorials/SimpleActionClient%28Threaded%29

int main (int argc, char **argv) {

  ros::init(argc,argv,"watering_client");

  actionlib::SimpleActionClient<thorvald_sprayer::WateringAction> ac("watering");


  ROS_INFO("Waiting for action server to start.");
  ac.waitForServer();

  ROS_INFO("Action server started, sending goal.");
  thorvald_sprayer::WateringGoal goal;

  double flow_sec = (double)OPEN_FLOW/3600.0; //We need to have the flow in L/s A RECALCULER SANS LES ROBINETS
  double watering_duration = VOLUME/flow_sec;

  ROS_INFO("The watering task will last for %0.2f s", watering_duration);
  ROS_INFO("Processing task...");
  goal.duration_ = watering_duration;
  ac.sendGoal(goal);

  /*Wait until result or timeout*/
  bool finished_before_timeout = ac.waitForResult(ros::Duration(30.0));

  if (finished_before_timeout) {
    actionlib::SimpleClientGoalState state = ac.getState();
    ROS_INFO("Action finished: %s",state.toString().c_str());
  }
  else {
    ROS_INFO("Action did not finish before the time out.");
  }

  ros::shutdown();
  ros::spin();

  return 0;
}
