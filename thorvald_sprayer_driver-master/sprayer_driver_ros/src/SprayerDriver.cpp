/****************************************************************
 *
 * Copyright (c) 2017
 *
 * Norwegian university of Life Sciences (NMBU)
 * Robotics and Control
 *
 *
 * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *
 * Project name: Thorvald II
 * ROS package name: sprayer_driver
 * Description: This node handles the coordination between the navigation and 
 *              the sprayer module of the Thorvald II class of robots
 *
 * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *
 * Author: Pierre Pezelet, email:pierre.pezelet@isen.yncrea.fr
 * Maintainer: Lars Grimstad, email:lars.grimstad@nmbu.no
 *
 *
 * Date of creation: Aug 2017
 * ToDo: - Clean up
 * 
 *
 *
 ****************************************************************/

//##################
//#### includes ####

// standard includes
#include <unistd.h>
#include <cmath>

// ROS includes
#include <ros/ros.h>

// ROS message includes
#include <std_msgs/Int16.h>
#include <std_msgs/Bool.h>

// ROS service includes
#include <std_srvs/Trigger.h>

// external includes


class SprayerDriver
{
  public:
   
    // Constructor
    SprayerDriver();
    
    // Destructor
    ~SprayerDriver();
  
    // Methods for handling feedback from nodes
    void tasksCoordination();

  private:

    // possible drive modes
    enum DriveModes
    {
      MODE_FORWARD, MODE_LEFT, MODE_TURNING,
      NUMBER_OF_MODES
    };
  
    // create a handle for this node, initialize node
    ros::NodeHandle n_;

    // subscribers
    ros::Subscriber pump_status_sub_;
    ros::Subscriber nav_request_sub_;
    ros::Subscriber tank_full_trigger_sub_;
    
    // publishers
    ros::Publisher pump_cmd_pub_;

    // members to get from ROS parameter server
    //bool simulation_;
    //std::string ini_directory_;

    // members to get from .ini file
    //int spreader_pressure_;
 
    // ROS services
    //ros::ServiceServer server_setup_controller_;
    //ros::ServiceServer server_drive_mode_;
  
    // drive mode
    int pump_mode_;
    int pump_state_;
    bool nav_request_value_;
    //int previous_pump_mode_;

    // ROS topic callbacks
    /*void jointStateCmdCallback(const base_drive_chain::BaseStateConstPtr& msg);*/
    void pumpStatusCallback(const std_msgs::Int16ConstPtr& pump_status_msg);
    void navRequestCallback(const std_msgs::Bool& nav_request_msg);

    // ROS service callbacks
    /*bool srvCallbackSetupController(base_drive_chain::MotorControllerSetup::Request &req,
                     base_drive_chain::MotorControllerSetup::Response &res);
    bool srvCallbackDriveMode(std_srvs::Trigger::Request &req, std_srvs::Trigger::Response &res);*/
    
    //bool getParam (const std::string& "drivechain/pump_ok", parameter_type& output_value) const;

};



// Constructor
SprayerDriver::SprayerDriver()
{

  // look up parameter on ROS parameter server
  /*bool params_loaded = lookupParameters();

  if (params_loaded)
  {
    ROS_INFO("Parameters read from ROS parameter server");
  }
  else
  {
    ROS_WARN("One or more parameters could not be found on ROS parameter server. Exiting program.");
    exit(EXIT_FAILURE);
  }

  if(simulation_)
  {
    ROS_WARN("Simulation mode. No need for base driver. Exiting program.");
    exit(EXIT_SUCCESS);
  }*/

  // publish to topics
  pump_cmd_pub_ = n_.advertise<std_msgs::Bool>("pump_cmd", 1);


  // subscribe to topics 
  pump_status_sub_ = n_.subscribe("pump_state", 1, &SprayerDriver::pumpStatusCallback, this);
  nav_request_sub_ = n_.subscribe("nav_request", 1, &SprayerDriver::navRequestCallback, this);
  //pump_cmd_sub_ = n_.subscribe("cmd_bool", 1, &SprayerDriver::motorCmdCallback, this);

 
  // advertise services
  /*
  server_setup_controller_ = n_.advertiseService("setup_controller", &SprayerDriver::srvCallbackSetupController, this);
  server_drive_mode_ = n_.advertiseService("drive_mode", &SprayerDriver::srvCallbackDriveMode, this);
  */

  // initiate variables
  pump_state_= 1;
  nav_request_value_= 0;
}


// Destructor
SprayerDriver::~SprayerDriver()
{

}

// Subscribing Callbacks
void SprayerDriver::pumpStatusCallback(const std_msgs::Int16ConstPtr& pump_status_msg)
{  
    ROS_INFO("Pump status received %d",pump_status_msg->data);
    pump_state_ = pump_status_msg->data;
}

void SprayerDriver::navRequestCallback(const std_msgs::Bool& nav_request_msg)
{  
    ROS_INFO("Nav request received %d",nav_request_msg.data);
    nav_request_value_ = nav_request_msg.data;
}

// Services 
// put controllers in drive mode
/*bool SprayerDriver::srvCallbackDriveMode(std_srvs::Trigger::Request &req, std_srvs::Trigger::Response &res)
{
  for (int i=0; i<number_of_drives_; i++)
  {
    ROS_INFO("drive mode selected for module: %d", i+1);
    driveMode(i+1);
  }
  res.success = true;
  res.message = "mode commands sent";
  return true;

}*/

void SprayerDriver::tasksCoordination()
{
  std::string pump_ok_;
  n_.param<std::string>("pump_ok", pump_ok_,"0");

  std_msgs::Bool bool_msg;

  //bool_msg.data = true;

  if (nav_request_value_) {
    if (pump_state_ = 3){
      bool_msg.data = true;
      n_.setParam("pump_ok", "1");
      ROS_INFO("PUMP OK");
   }
    else {
      bool_msg.data = true;
      n_.setParam("pump_ok", "0");
      ROS_INFO("PUMP NOK");
    }
  }
  else {
    bool_msg.data = false;
    n_.setParam("pump_ok", "0");
    ROS_INFO("PUMP NOK");
  }

  pump_cmd_pub_.publish(bool_msg);
  if(bool_msg.data == 0){ROS_INFO("PUMP OFF");}
  else {ROS_INFO("PUMP ON");}
}

// Methods

//#######################
//#### main programm ####
int main(int argc, char** argv)
{
  ros::init(argc, argv, "thorvald_pesticides_spreader");
  SprayerDriver sprayer_driver;
  ros::Rate rate(20);
  
  while(ros::ok())
  {
    sprayer_driver.tasksCoordination();
    ros::spinOnce();
    rate.sleep();
  }
//  
  return 0;
}
