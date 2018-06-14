#include "ros/ros.h"
#include <actionlib/server/simple_action_server.h>
#include <thorvald_sprayer/WateringAction.h>
#include <std_msgs/Int8.h>

using namespace std;

// http://docs.ros.org/jade/api/actionlib/html/classactionlib_1_1SimpleActionServer.html
// http://wiki.ros.org/actionlib_tutorials/Tutorials/SimpleActionServer%28ExecuteCallbackMethod%29
// http://wiki.ros.org/actionlib_tutorials/Tutorials/SimpleActionServer%28GoalCallbackMethod%29

class WateringAction {

public :

  WateringAction(string name) :
    as_(n_, name, boost::bind(&WateringAction::executeCB, this, _1), false),
    action_name_(name)
  {
    as_.start();
    pub_ = n_.advertise<std_msgs::Int8>("/sprayer_task",1000);
  }

  ~WateringAction(void) {
  }

  ros::Publisher getPublisher() const { return pub_; };
  std_msgs::Int8 getMsg() { return msg; };

  /*Execute callback: Send a start request to the pump and then wait for a certain amount of time, then send a stop request*/
  void executeCB(const thorvald_sprayer::WateringGoalConstPtr& goal) {
    double watering_duration = goal->duration_;
    clock_t start;
    double uptime = 0.0;
    bool success = true;

    ROS_INFO("The watering task will last for %0.2f s", goal->duration_);
    ROS_INFO("Processing task...");

    start = clock();

    while(uptime < watering_duration) {

      if (as_.isPreemptRequested() || !ros::ok()) {
        ROS_INFO("%s: Preempted", action_name_.c_str());
        // set the action state to preempted
        as_.setPreempted();
        success = false;
        break;
      }

      uptime = ( clock() - start ) / (double) CLOCKS_PER_SEC;
      //ROS_INFO("Uptime %lf", uptime);
      //feedback_.performing_task =  ((int)uptime*100)/watering_duration; //Doesn't work properly, needs some adjustments
      //as_.publishFeedback(feedback_);
      msg.data = 1;
      pub_.publish(msg);
    }

    msg.data = 0;
    pub_.publish(msg);


    if (success) {
      result_.result = uptime;
      ROS_INFO("%s: Succeeded", action_name_.c_str());
      // set the action state to succeeded
      as_.setSucceeded(result_);
    }
  }



private :

  ros::NodeHandle n_;

  actionlib::SimpleActionServer<thorvald_sprayer::WateringAction> as_;
  thorvald_sprayer::WateringFeedback feedback_;
  thorvald_sprayer::WateringResult result_;
  string action_name_;
  ros::Publisher pub_;
  std_msgs::Int8 msg;

};


int main(int argc, char **argv)  {

  ros::init(argc,argv,"watering_server");

  WateringAction watering("watering");

  watering.getPublisher().publish(watering.getMsg());

  ros::MultiThreadedSpinner spinner(0);
  spinner.spin();

  return 0;
}
