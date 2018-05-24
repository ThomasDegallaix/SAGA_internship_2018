#include "ros/ros.h"
#include <thorvald_sprayer/CANFrame.h>
#include <thorvald_sprayer/sprayer_controller.h>
#include "std_msgs/String.h"
#include <cstring>

//https://www.geeksforgeeks.org/c-classes-and-objects/
//https://answers.ros.org/question/59725/publishing-to-a-topic-via-subscriber-callback-function/

//Destructor ?

using namespace std;

/*List of used TPDO, for more informations look at the roboteq datasheet*/
enum RPDO {rpdo1=0x200,rpdo2=0x300,rpdo3=0x400,rpdo4=0x500};

/*Structure used to store the service request*/
struct Request {
  string order;
  int nodeID;
};

class ThorvaldSprayer {

public:

  /* Constructor */
  ThorvaldSprayer() {
    pub_ = n_.advertise<thorvald_sprayer::CANFrame>("/can_frames_device_t",1000);
    ss_ = n_.advertiseService("sprayer_controller",serviceCallback);
  }

  /*callback for the service client*/
  bool serviceCallback(thorvald_sprayer::sprayer_controller::Request &req, thorvald_sprayer::sprayer_controller::Response &res) {
    getRequest(&request,req);
    if(strcmp(req.order.c_str(),"ON") == 0) {
      res.message = "ON request has been given";
    }
    else if(strcmp(req.order.c_str(),"OFF") == 0) {
      res.message = "OFF request has been given";
    }
    else {
      res.message = "ERR: Request not recognised";
    }
    return true;
  }


  /* Callback for the pressure enslavement */
  //TODO


private:

  /*Start the node*/
  ros::NodeHandle n_;

  ros::Publisher pub_; //TO USE
  ros::subscriber sub_;
  ros::ServiceServer ss_;

  Request OnOffRequest;
  bool tankIsEmpty;

};


void ThorvaldSprayer::getRequest() {
  
}










int main(int argc, char **argv) {

  /*Initializing the node*/
  ros::init(argc,argv,"sprayer_node_v5");

  ThorvaldSprayer sprayer;

  return 0;
}
