/**
 * Data.cpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 18 17:39:01 2013
 */
#include <cstdlib> 
#include <cstring> 
#include "data.hpp"
#include "cpp_output_handler.hpp"
#include "options_vars.hpp"

/* default namespace for Raft */
using namespace Raft;

Data::Data()
: rf_parsestream( nullptr ),
  rf_errorstream( nullptr ),
  userstream( std::cout ),
  errorstream( std::cerr ),
  cpp_handler( nullptr )
{
   rf_parsestream = new RFParseStream();
   rf_errorstream = new RFErrorStream();
   cpp_handler    = new CPP_OutputHandler( (*this) );
}

Data::~Data()
{
   if( rf_errorstream != nullptr )
   {
      delete( rf_errorstream );
      rf_errorstream = nullptr;
   }
   if( rf_parsestream != nullptr )
   {
      delete( rf_parsestream );
      rf_parsestream = nullptr;
   }
   if( cpp_handler != nullptr )
   {
      delete( cpp_handler );
      cpp_handler = nullptr;
   }
}

void Data::Final()
{
   if( rf_errorstream != nullptr )
   {
      errorstream << "The following system error(s) were detected:\n";
      errorstream << (*rf_errorstream).str() << "\n";
      errorstream << "Done with errorstream." << std::endl; /* just in case std::out */
      exit( EXIT_FAILURE );
   }
   else
   {
      exit( EXIT_SUCCESS );
   }
}

std::ostream& Data::PrintErrors( std::ostream &stream )
{
   stream << get_rf_errorstream().str() << "\n";
   return( stream );
}

std::ostream& Data::PrintParseErrors( std::ostream &stream )
{
   stream << get_rf_parsestream().str() << "\n";
   return( stream );
}



void Data::reset_rf_parsestream()
{
   if( rf_parsestream != nullptr )
   { 
      delete( rf_parsestream ); 
      rf_parsestream = nullptr;
   }
   assert( rf_parsestream == nullptr );
}

RFParseStream& Data::get_rf_parsestream()
{
   if( rf_parsestream == nullptr )
   {
      rf_parsestream = new RFParseStream();
   }
   return( (*rf_parsestream) );
}

void  Data::reset_rf_errorstream()
{
   if( rf_errorstream != nullptr )
   { 
      delete( rf_errorstream ); 
      rf_errorstream = nullptr;
   }
}

RFErrorStream& Data::get_rf_errorstream()
{
   if( rf_errorstream == nullptr )
   {
      rf_errorstream = new RFErrorStream();
   }
   return( (*rf_errorstream) );
}

UserStream&  Data::get_userstream()
{
   return( userstream );
}

ErrorStream&   Data::get_errorstream()
{
   return( errorstream );
}

CPP_OutputHandler&
Data::get_cpp_handler()
{
   return( *cpp_handler );
}
void     Data::set_options_vars( Options_Vars *vars )
{
   assert( vars != nullptr );
   (this)->options = vars;
}

Options_Vars&  Data::get_options_vars()
{
   assert( (this)->options != nullptr );
   return( (*(this)->options) );
}
