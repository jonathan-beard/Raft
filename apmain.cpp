/**
 * apmain.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Feb 15 15:52:31 2013
 */
#include <iostream>
#include <cstdlib>
#include <cassert>

#include "ap_data.hpp"
#include "ap_prep.hpp"
#include "app.hpp"
//#include "ap_driver.hpp"
#include "signalhooks.hpp"

AP_Data ap_data;

static void 
parse_handler( int signal )
{
   ap_data.PrintParseErrors( std::cerr );
   ap_data.reset_ap_parsestream();
   ap_data.PrintErrors( std::cerr );
   ap_data.reset_ap_errorstream();
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
   auto *files( AP_Prep::get_ap_includes( argv[1] , ap_data ) );
   assert( files != nullptr );
   for( const std::string &str : (*files) ){
      app.add_file( str );
   }
   delete( files );
   
   app.run( argv[1] );

   std::stringstream &output( app.output() );
   
   std::cout << output.str() << std::endl; 
   std::set<std::string> &file_list( app.get_file_list() );
   auto &paths( app.get_include_paths() );
   for( std::pair< std::string, std::string> str : paths ){
      std::cout << str.first << " - " << str.second << std::endl; 
   }

   //std::istringstream parser_stream( output.str() );
 
   //APParse::X_Driver driver( data );
   //std::cout << "Calling parse!!\n";
   //driver.parse( parser_stream );
   //std::cout << "Done with parse!!\n";
   /* just in case raise parse error stream to flush it if there are any */
   
   raise( PARSE_ERR_SIG );
   return( EXIT_SUCCESS );
}
