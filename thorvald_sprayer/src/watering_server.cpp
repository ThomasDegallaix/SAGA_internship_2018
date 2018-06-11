#include "ros/ros.h"
#include <actionlib/server/simple_action_server.h>
#include <thorvald_sprayer/WateringAction.h>

using namespace std;

// http://docs.ros.org/jade/api/actionlib/html/classactionlib_1_1SimpleActionServer.html
// http://wiki.ros.org/actionlib_tutorials/Tutorials/SimpleActionServer%28ExecuteCallbackMethod%29
// http://wiki.ros.org/actionlib_tutorials/Tutorials/SimpleActionServer%28GoalCallbackMethod%29

class WateringAction {

public :

  WateringAction(string name) :
    as_(n_, name, false),
    action_name_(name)
  {
    as_.registerGoalCallback(boost::bind(&WateringAction::goalCallback,this));
    as_.registerPreemptCallback(boost::bind(&WateringAction::preemptCallback,this));

    as_.start();
  }

  ~WateringAction(void) {
  }

  void goalCallback() {

    //TODO

    goal = as_.acceptNewGoal()->order;
  }

  void preemptCallback() {
    ROS_INFO("%s: Preempted", action_name_.c_str());
    as_.setPreempted();
  }


private :

  ros::NodeHandle n_;

  actionlib::SimpleActionServer<thorvald_sprayer::WateringAction> as_;
  thorvald_sprayer::WateringFeedback feedback_;
  thorvald_sprayer::WateringResult result_;
  string action_name_;

  int planting_count;
  double distanceTraveled, goal;
};


int main(int argc, char **argv)  {

  ros::init(argc,argv,"watering_server");

  WateringAction watering("watering");
  ros::spin();

  return 0;
}
