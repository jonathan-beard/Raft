/**
 * AP_Data.cpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 18 17:39:01 2013
 */
#include <cstdlib> /* for exit defines */
#include "ap_data.hpp"
#include "ap_option_vars.hpp"

AP_Data::AP_Data()
: ap_parsestream( nullptr ),
  ap_errorstream( nullptr ),
  userstream( std::cout ),
  errorstream( std::cerr ),
  current_line( 0 )
{
   ap_parsestream = new APParseStream();
   ap_errorstream = new APErrorStream();
}

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

std::ostream& AP_Data::PrintErrors( std::ostream &stream )
{
   stream << get_ap_errorstream().str();
   return( stream );
}

std::ostream& AP_Data::PrintParseErrors( std::ostream &stream )
{
   stream << get_ap_parsestream().str();
   return( stream );
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

void     AP_Data::set_options_vars( AP_Options_Vars *vars )
{
   assert( vars != nullptr );
   (this)->options = vars;
}

AP_Options_Vars&  AP_Data::get_options_vars()
{
   assert( (this)->options != nullptr );
   return( (*(this)->options) );
}
