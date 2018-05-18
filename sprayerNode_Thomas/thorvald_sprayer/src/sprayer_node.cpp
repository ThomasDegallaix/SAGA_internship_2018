#include "ros/ros.h"
#include <thorvald_sprayer/CANopen_command.h>
#include "std_msgs/String.h"

/*TODO:
- pub functions
- subscriber
- use of feedback
*/

//https://github.com/g/roboteq

/*In order to read what is published on the topic :
rostopic echo /theTopicIshouldUse
*/

using namespace std;

/*List of used TPDO, for more informations look at the roboteq datasheet*/
enum RPDO {rpdo1=0x200,rpdo2=0x300};


/*Function used to fulfill a message which will be published on a topic*/
thorvald_sprayer::CANopen_command process_data(thorvald_sprayer::CANopen_command *msg, RPDO rpdo, char** argv) {
  /*Fulfill the message*/
  msg->can_id = rpdo + atoi(argv[1]);
  msg->data[0] = 1;
  msg->data[1] = 1;
  msg->length = sizeof(msg->data);

  return *msg;
}

/*Simple procedure which displays some informations*/
void display_infos(thorvald_sprayer::CANopen_command *msg, int count, char** argv) {
  /*Display infos*/
  ROS_INFO("#%d Sending data to RPDO%d", count, atoi(argv[2]));
  ROS_INFO("Header: %d", msg->can_id);
  ROS_INFO("Length: %d", msg->length); //to be modified ?
  ROS_INFO("Content: [%d,%d]", msg->data[0], msg->data[1]);
}


int main(int argc, char **argv) {

  if(argc < 3) {
    ROS_WARN("Usage: %s [NODE_id] [RPDO number (1 or 2)]", argv[0]);
    return 1;
  }
  else if(atoi(argv[2]) != 1 && atoi(argv[2]) != 2) {
    ROS_WARN("The RPDO number must be 1 or 2");
    return 1;
  }

  /*Initializing the node*/
  ros::init(argc,argv,"sprayer_node");

  /*Start the node*/
  ros::NodeHandle nh;

  ros::Publisher sprayer_pub = nh.advertise<thorvald_sprayer::CANopen_command>("/theTopicIshouldUse",1000);

  /*Sleep at a rate of 1Hz*/
  ros::Rate loop_rate(1);

  int count = 0;
  while(ros::ok()) {

    /*Instantiate a new message*/
    thorvald_sprayer::CANopen_command msg;

    RPDO rpdo;
    /*What RPDO are we using ?*/
    atoi(argv[2]) == 1 ? rpdo=rpdo1 : rpdo=rpdo2;

    process_data(&msg, rpdo, argv);
    display_infos(&msg, count, argv);

    sprayer_pub.publish(msg);

    ros::spinOnce();

    loop_rate.sleep();
    count++;

  }

  return 0;
}
