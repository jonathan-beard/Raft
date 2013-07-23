/**
 * set_options.hpp - 
 * @author: Jonathan Beard
 * @version: Thu May 16 09:13:02 2013
 */
#ifndef _SET_OPTIONS_HPP_
#define _SET_OPTIONS_HPP_  1

#include "command_arguments.h"
#include "data.hpp"

class Set_Options{
public:
   static void SetOptions( CmdArgs &cmd, Raft::Data &data );
};

#endif /* END _SET_OPTIONS_HPP_ */
