#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <actionlib/client/terminal_state.h>
#include <thorvald_sprayer/WateringAction.h>
#include <boost/thread.hpp>



int main (int argc, char **argv) {

  ros::init(argc,argv,"watering_client");

  actionlib::SimpleActionClient<thorvald_sprayer::WateringAction> ac("watering");


  ROS_INFO("Waiting for action server to start.");
  ac.waitForServer();

  ROS_INFO("Action server started, sending goal.");
  thorvald_sprayer::WateringGoal goal;
  goal.order

  return 0;
}
