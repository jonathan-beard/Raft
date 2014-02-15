#include <fstream>
#include <cassert>
#include <cstdlib>
#include <cstring>

#include <errno.h>
#include <unistd.h>

#include "signalhooks.hpp"
#include "driver.hpp"
#include "data.hpp"

#ifndef ACCEPT
#define ACCEPT 0
#endif

#ifndef ERRBUFFSIZE
#define ERRBUFFSIZE 4096
#endif

using namespace Raft;

Driver::Driver(Data &d) :  parser( nullptr),
                                    scanner( nullptr),
                                    data( d ),
                                    root( nullptr )
{
 /* nothing else to really do here */
}

Driver::~Driver()
{
   if( parser != nullptr){
      delete( parser );
      parser = nullptr;
   }
   if( scanner != nullptr ){
      delete( scanner );
      scanner = nullptr;
   }
   for( auto visitor : visitor_list )
   {
      delete( visitor );
   }
}

void
Driver::parse( const char *filename )
{
   assert( filename != nullptr );
   std::ifstream in_file( filename );
   if( ! in_file.good() ) exit( EXIT_FAILURE );
   scanner = new Scanner( &in_file , data );
   assert( scanner != nullptr );
   parser = new Parser( (*scanner), (*this), data );
   assert( parser != nullptr );
   int retval( ACCEPT );
   errno = EXIT_SUCCESS;
   if( (retval = parser->parse() ) != ACCEPT )
   {
      parse_error( errno, retval );
   }
}

void
Driver::parse( std::istringstream &iss )
{
   scanner = new Scanner( &iss , data );
   assert( scanner != nullptr );
   parser = new Parser( (*scanner), (*this), data );
   assert( parser != nullptr );
   int retval( ACCEPT );
   errno = EXIT_SUCCESS;
   if( (retval = parser->parse() ) != ACCEPT )
   {
      parse_error( errno, retval );
   }
}


void 
Driver::parse_error( int errorcode, int retval )
{
   data.get_rf_errorstream() << "Error calling parse(), ";
   data.get_rf_errorstream() << "exited with code (" << retval << ") ";
   if( errorcode != EXIT_SUCCESS ){
      char msg[ ERRBUFFSIZE ];
      if( strerror_r( errorcode, msg, ERRBUFFSIZE ) != EXIT_SUCCESS )
      {
         data.get_rf_errorstream() << "Error getting error code, exiting!!\n";
         raise( TERM_ERR_SIG );
      }
      data.get_rf_errorstream() << "and error message of \"" << msg << "\"";
   }
   data.get_rf_errorstream() << "\n";
   raise( TERM_ERR_SIG );
}

void
Driver::set_root( Node::NodeAbstract *r )
{
   assert( r != nullptr );
   root = r;
}

void
Driver::RegisterVisitor( Visitor::DefaultVisitor *visitor )
{
   assert( visitor != nullptr );
   this->visitor_list.push_back( visitor );
}

void
Driver::InvokeVisitors()
{
   for( Visitor::DefaultVisitor *v : visitor_list )
   {
      /* invoke the visitor on the tree */
      Node::NodeAbstract::invoke( *v, root );
   }
}
