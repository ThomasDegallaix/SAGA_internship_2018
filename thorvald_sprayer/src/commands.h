#include "std_msgs/String.h"

#ifndef COMMANDS_H //Header guard
#define COMMANDS_H


/* Storage for every command used by the sprayer */
/* A command needs to have the name of the rpdo used a (from rdpo1 to 4) and the 8 bytes of data */

namespace commands {

  extern const std::string OFF[9] = {"rpdo1","0","0","0","0","0","0","0","0"};
  extern const std::string ON[9] = {"rpdo1","1","0","0","0","0","0","0","0"};
  
}

#endif
