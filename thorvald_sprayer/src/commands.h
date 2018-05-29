#include "std_msgs/String.h"

#ifndef COMMANDS_H
#define COMMANDS_H
#endif

/* Storage for every command used by the sprayer */

namespace commands {

  const std::string ON[9] = {"rpdo1","1","0","0","0","0","0","0","0"};
  const std::string OFF[9] = {"rpdo1","0","0","0","0","0","0","0","0"};

}
