/**
 * ap_common.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 20 13:20:59 2013
 */
#include <cassert>
#include <string>
#include <iostream>
#include <sstream>
#include "ap_common.hpp"

void
Dump( const std::string &dump_str,
      const std::string dump_file )
{
   assert( dump_file.length() > 0 );
   std::ofstream out_file( dump_file );
   if( out_file.is_open() )
   {
      out_file << dump_str << "\n";
   }
   out_file.close();
}
