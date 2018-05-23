#include "ros/ros.h"
#include <thorvald_sprayer/CANFrame.h>
#include "std_msgs/String.h"
#include <cstring>

/*TODO:
- gestion de la pression désirée
- Classe pour le message ?
- subscriber
- use of feedback
- interface ?
*/

//https://github.com/g/roboteq

using namespace std;

/*List of used TPDO, for more informations look at the roboteq datasheet*/
enum RPDO {rpdo1=0x200,rpdo2=0x300};


/*Function used to fulfill the message*/
thorvald_sprayer::CANFrame fulfill_message(thorvald_sprayer::CANFrame *msg, int rpdo, int node_id, int var_1, int var_2) {

  msg->can_id = rpdo + node_id;

  /*Initialing the data array*/
  for(int i=0;i<8;i++) {
    msg->data[i] = 0;
  }
  msg->data[0] = var_1;
  msg->data[3] = var_2;
  msg->length = 8;

  return *msg;
}

/*Function used to create the correct message according to the action asked by the user*/
thorvald_sprayer::CANFrame process_data(thorvald_sprayer::CANFrame *msg, RPDO rpdo, char** argv) {

  if(strcmp(argv[2],"init") == 0) {
    fulfill_message(msg,rpdo,atoi(argv[1]),1,0);
  }
  else if(strcmp(argv[2],"run") == 0) {
    fulfill_message(msg,rpdo,atoi(argv[1]),2,0);
  }
  else if(strcmp(argv[2],"break") == 0){
    fulfill_message(msg,rpdo,atoi(argv[1]),0,1);
  }
  else{
    ROS_WARN("/!\\ Doesn't know which action has to be performed /!\\");
  }

  return *msg;
}

/*Simple procedure which displays some informations*/
void display_infos(thorvald_sprayer::CANFrame *msg, int count, char** argv) {
  /*Display infos*/
  if(argv[2] == "init" || "run" || "break") {
    ROS_INFO("#%d Sending data to RPDO1", count);
  }
  else{
    ROS_INFO("#%d Sending data to RPDO2", count);
  }
  ROS_INFO("ID: %d", msg->can_id);
  ROS_INFO("Length: %d", msg->length);
  ROS_INFO("Data: [%d,%d]", msg->data[0], msg->data[3]);
}


int main(int argc, char **argv) {

  /*Initializing the node*/
  ros::init(argc,argv,"sprayer_node_v2");

  if(argc != 3 ) {
    ROS_WARN("Usage: %s [NODE_id] [Action to perform]", argv[0]);
    ROS_WARN("Action to perform: \n    - [init]\n    - [run]\n    - [break]\r");
    return 1;
  }

  /*Start the node*/
  ros::NodeHandle nh;

  ros::Publisher sprayer_pub = nh.advertise<thorvald_sprayer::CANFrame>("/can_frames_device_t",1000);

  /*Sleep at a rate of 1Hz*/
  ros::Rate loop_rate(1);

  int count = 0;
  while(ros::ok()) {

    /*Instantiate a new message*/
    thorvald_sprayer::CANFrame msg;

    RPDO rpdo;
    /*What RPDO are we using ?*/
    argv[2] == "init" || "run" || "break" ? rpdo=rpdo1 : rpdo=rpdo2;

    process_data(&msg, rpdo, argv);
    display_infos(&msg, count, argv);

    sprayer_pub.publish(msg);

    ros::spinOnce();

    loop_rate.sleep();
    count++;

  }

  return 0;
}
