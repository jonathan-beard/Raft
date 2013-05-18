#include <fstream>
#include <cassert>
#include <cstdlib>

#include <errno.h>
#include <unistd.h>

#include "signalhooks.hpp"
#include "ap_driver.hpp"
#include "ap_ata.hpp"

#ifndef ACCEPT
#define ACCEPT 0
#endif

using namespace AP;

AP_Driver::AP_Driver(Data &d) :  parser( nullptr),
                                 scanner( nullptr),
                                 data( d )
{
 /* nothing else to really do here */
}

AP_Driver::~AP_Driver()
{
   if( parser != nullptr){
      delete( parser );
      parser = nullptr;
   }
   if( scanner != nullptr ){
      delete( scanner );
      scanner = nullptr;
   }
}

void
AP_Driver::parse( const char *filename )
{
   assert( filename != nullptr );
   std::ifstream in_file( filename );
   if( ! in_file.good() ) exit( EAPIT_FAILURE );
   scanner = new AP_Scanner( &in_file , data );
   assert( scanner != nullptr );
   parser = new AP_Parser( (*scanner), (*this), data );
   assert( parser != nullptr );
   int retval( ACCEPT );
   errno = EXIT_SUCCESS;
   if( (retval = parser->parse() ) != ACCEPT )
   {
      parse_error( errno, retval );
   }
}

void
AP_Driver::parse( std::istringstream &iss )
{
   scanner = new AP_Scanner( &iss , data );
   assert( scanner != nullptr );
   parser = new AP_Parser( (*scanner), (*this), data );
   assert( parser != nullptr );
   int retval( ACCEPT );
   errno = EXIT_SUCCESS;
   if( (retval = parser->parse() ) != ACCEPT )
   {
      parse_error( errno, retval );
   }
}


void 
AP_Driver::parse_error( int errorcode, int retval )
{
   data.errorstream() << "Error calling parse(), ";
   data.errorstream() << "exited with code (" << retval << ") ";
   if( errorcode != EXIT_SUCCESS ){
      data.errorstream() << "and error code of \""
         << strerror( errorcode ) << "\"";
   }
   data.errorstream() << "\n";
   raise( TERM_ERR_SIG );
}
