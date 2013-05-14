/**
 * apmain.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Feb 15 15:52:31 2013
 */
#include <iostream>
#include <cstdlib>
#include "apprep.hpp"
#include "app.hpp"
#include "ap_driver.hpp"
#include "signalhooks.hpp"

AP_Data ap_data;

static void 
parse_handler( int signal )
{
   ap_data.print_parse_error( std::cerr );
   ap_data.reset_parse_stream();
   ap_data.print_errors( std::cerr );
   ap_data.reset_errors();
}

int
main( const int argc, const char **argv )
{
   /* right now don't worry about arg counts */
   errno = 0;
   if( signal( PARSE_ERR_SIG, parse_handler ) == SIG_ERR )
   {
      perror( "Error setting parse_handler" );
      exit( EXIT_FAILURE );
   }

   APP app( ap_data );

   return( EXIT_SUCCESS );
}
