/**
 * AP_Data.cpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 18 17:39:01 2013
 */
#include <cstdlib> /* for exit defines */
#include "AP_Data.hpp"

AP_Data::~AP_Data()
{
   if( ap_errorstream != nullptr )
   {
      delete( ap_errorstream );
      ap_errorstream = nullptr;
   }
   if( ap_parsestream != nullptr )
   {
      delete( ap_parsestream );
      ap_parsestream = nullptr;
   }
}

void AP_Data::Final()
{
   if( ap_errorstream != nullptr )
   {
      errorstream << "The following error(s) were detected:\n";
      errorstream << (*ap_errorstream).str() << "\n";
      errorstream << "Done with errorstream." << std::endl; /* just in case std::out */
      exit( EXIT_FAILURE );
   }
   else
   {
      exit( EXIT_SUCCESS );
   }
}

void AP_Data::reset_ap_parsestream()
{
   if( ap_parsestream != nullptr ){ delete( ap_parsestream ); }
   ap_parsestream = nullptr;
}

APParseStream& AP_Data::get_ap_parsestream()
{
   if( ap_parsestream == nullptr )
   {
      ap_parsestream = new APParseStream();
   }
   return( (*ap_parsestream) );
}

void  AP_Data::reset_ap_errorstream()
{
   if( ap_errorstream != nullptr ){ delete( ap_errorstream ); }
   ap_errorstream = nullptr;
}

APErrorStream& AP_Data::get_ap_errorstream()
{
   if( ap_errorstream == nullptr )
   {
      ap_errorstream = new APErrorStream();
   }
   return( (*ap_errorstream) );
}

void  AP_Data::set_current_line( uint64_t line_number )
{
   current_line = line_number;
}

uint64_t AP_Data::get_current_line()
{
   return( current_line );
}  


