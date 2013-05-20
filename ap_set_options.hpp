/**
 * ap_set_options.hpp - 
 * @author: Jonathan Beard
 * @version: Thu May 16 09:13:02 2013
 */
#ifndef _AP_SET_OPTIONS_HPP_
#define _AP_SET_OPTIONS_HPP_  1

#include "command_arguments.h"
#include "ap_data.hpp"

class AP_Set_Options{
public:
   static void SetOptions( CmdArgs &cmd, AP::AP_Data &data );
};

#endif /* END _AP_SET_OPTIONS_HPP_ */
