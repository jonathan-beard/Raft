/**
 * AP_Data.cpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 18 17:39:01 2013
 */
#include <cstdlib> 
#include <cstring> 
#include "ap_data.hpp"
#include "ap_cpp_output_handler.hpp"
#include "ap_options_vars.hpp"

/* default namespace for AutoPipe */
using namespace AP;

AP_Data::AP_Data()
: ap_parsestream( nullptr ),
  ap_errorstream( nullptr ),
  userstream( std::cout ),
  errorstream( std::cerr ),
  cpp_handler( nullptr )
{
   ap_parsestream = new APParseStream();
   ap_errorstream = new APErrorStream();
   cpp_handler    = new AP_CPP_OutputHandler( (*this) );
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
   if( cpp_handler != nullptr )
   {
      delete( cpp_handler );
      cpp_handler = nullptr;
   }
}

void AP_Data::Final()
{
   if( ap_errorstream != nullptr )
   {
      errorstream << "The following system error(s) were detected:\n";
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
   stream << get_ap_errorstream().str() << "\n";
   return( stream );
}

std::ostream& AP_Data::PrintParseErrors( std::ostream &stream )
{
   stream << get_ap_parsestream().str() << "\n";
   return( stream );
}



void AP_Data::reset_ap_parsestream()
{
   if( ap_parsestream != nullptr )
   { 
      delete( ap_parsestream ); 
      ap_parsestream = nullptr;
   }
   assert( ap_parsestream == nullptr );
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
   if( ap_errorstream != nullptr )
   { 
      delete( ap_errorstream ); 
      ap_errorstream = nullptr;
   }
}

APErrorStream& AP_Data::get_ap_errorstream()
{
   if( ap_errorstream == nullptr )
   {
      ap_errorstream = new APErrorStream();
   }
   return( (*ap_errorstream) );
}

UserStream&  AP_Data::get_userstream()
{
   return( userstream );
}

ErrorStream&   AP_Data::get_errorstream()
{
   return( errorstream );
}
#if(0)
void  AP_Data::set_current_line( uint64_t line_number )
{
   current_line = line_number;
}

uint64_t AP_Data::get_current_line()
{
   return( current_line );
}  

void
AP_Data::set_current_parse_file( const std::string file )
{
   current_parse_file = file;
}

std::string
AP_Data::get_current_parse_file()
{
   return( current_parse_file );
}

void
AP_Data::set_whole_current_line( char *line )
{
   const int line_length( strlen( line ) );
   char *line_buffer( nullptr );
   line_buffer = (char*) alloca( sizeof(char) * line_length );
   assert( line_buffer != nullptr );
   memset( line_buffer, '\0', line_length );
   const auto num_read( sscanf( line, "%[^\n]\n",line_buffer ) );
   if( num_read == EOF )
   {
      whole_current_line = "";
   }
   else if( num_read == 0 )
   {
      whole_current_line = "";
   }
   else
   {
      std::stringstream ss;
      ss << *line_buffer;
      whole_current_line = ss.str();
   }
}

std::string
AP_Data::get_whole_current_line()
{
   return( whole_current_line );
}


#endif

AP_CPP_OutputHandler&
AP_Data::get_cpp_handler()
{
   return( *cpp_handler );
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
