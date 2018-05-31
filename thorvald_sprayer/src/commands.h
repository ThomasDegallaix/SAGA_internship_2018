#include "std_msgs/String.h"

#ifndef COMMANDS_H //Header guard
#define COMMANDS_H


/* Storage for every command used by the sprayer */
/* A command needs to have the name of the rpdo used a (from rdpo1 to 4) and the 8 bytes of data */

namespace commands {

  extern const std::string OFF[9] = {"rpdo1","0","0","0","0","0","0","0","0"};
  extern const std::string ON[9] = {"rpdo1","1","0","0","0","0","0","0","0"};
  extern const std::string MODE1[9] = {"rpdo1","2","0","0","0","0","0","0","0"};
  extern const std::string MODE2[9] = {"rpdo1","3","0","0","0","0","0","0","0"};
  extern const std::string MODE3[9] = {"rpdo1","4","0","0","0","0","0","0","0"};
  extern const std::string MODE4[9] = {"rpdo1","5","0","0","0","0","0","0","0"};
  extern const std::string MODE5[9] = {"rpdo1","6","0","0","0","0","0","0","0"};
  extern const std::string MODE6[9] = {"rpdo1","7","0","0","0","0","0","0","0"};
  extern const std::string MODE7[9] = {"rpdo1","8","0","0","0","0","0","0","0"};
  extern const std::string MODE8[9] = {"rpdo1","9","0","0","0","0","0","0","0"};
  extern const std::string MODE9[9] = {"rpdo1","10","0","0","0","0","0","0","0"};


}

#endif
