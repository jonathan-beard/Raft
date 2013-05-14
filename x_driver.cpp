#include <fstream>
#include <cassert>
#include <cstdlib>

#include <errno.h>
#include <unistd.h>

#include "signalhooks.hpp"
#include "x_driver.hpp"
#include "Data.hpp"

#ifndef ACCEPT
#define ACCEPT 0
#endif

using namespace APParse;

X_Driver::X_Driver(Data &d) :  parser( nullptr),
                               scanner( nullptr),
                               data( d )
{
 /* nothing else to really do here */
}

X_Driver::~X_Driver()
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
X_Driver::parse( const char *filename )
{
   assert( filename != nullptr );
   std::ifstream in_file( filename );
   if( ! in_file.good() ) exit( EXIT_FAILURE );
   scanner = new APParse::X_Scanner( &in_file , data );
   assert( scanner != nullptr );
   parser = new APParse::X_Parser( (*scanner), (*this), data );
   assert( parser != nullptr );
   int retval( 0 );
   errno = 0;
   if( (retval = parser->parse() ) != ACCEPT )
   {
      parse_error( errno, retval );
   }
}

void
X_Driver::parse( std::istringstream &iss )
{
   scanner = new APParse::X_Scanner( &iss , data );
   assert( scanner != nullptr );
   parser = new APParse::X_Parser( (*scanner), (*this), data );
   assert( parser != nullptr );
   int retval( 0 );
   errno = 0;
   if( (retval = parser->parse() ) != ACCEPT )
   {
      parse_error( errno, retval );
   }
}


void 
X_Driver::parse_error( int errorcode, int retval )
{
   data.errorstream() << "Error calling parse(), ";
   data.errorstream() << "exited with code (" << retval << ") ";
   if( errorcode != 0 ){
      data.errorstream() << "and error code of \""
         << strerror( errorcode ) << "\"";
   }
   data.errorstream() << "\n";
   raise( TERM_ERR_SIG );
}
