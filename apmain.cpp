/**
 * apmain.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Feb 15 15:52:31 2013
 */
#include <iostream>
#include <cstdlib>
#include <cassert>

#include "command_arguments.h"
#include "ap_data.hpp"
#include "ap_prep.hpp"
#include "app.hpp"
#include "ap_driver.hpp"
#include "signalhooks.hpp"

AP_Data ap_data;

static void 
parse_handler( int signal )
{
   std::stringstream parse_errstream;
   ap_data.PrintParseErrors( parse_errstream );
   const std::string parse_err_str( parse_errstream.str() );
   if( parse_err_str.length() > 0 )
   {
      std::cerr << "The following parse errors were detected:\n";
      std::cerr << parse_err_str << "\n";
   }
   ap_data.reset_ap_parsestream();
   std::stringstream errstream;
   ap_data.PrintErrors( errstream );
   const std::string err_str( errstream.str() );
   if( err_str.length() > 0 )
   {
      std::cerr << "The following errors were detected:\n";
      std::cerr << err_str << "\n";
   }
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

   /* set options object with defaults */
   AP_Options_Vars options;
   ap_data.set_options_vars( &options );

   /* Get a Cmd State Object & Set Options */
   CmdArgs cmd_args( argv[0] , ap_data );

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
  
/*  
   std::set<std::string> &file_list( app.get_file_list() );
   auto &paths( app.get_include_paths() );
   for( std::pair< std::string, std::string> str : paths ){
      std::cout << str.first << " - " << str.second << std::endl; 
   }
*/
   std::istringstream parser_stream( output.str() );
 
   AP::AP_Driver driver( ap_data );
   std::cout << "Calling parse!!\n";
   driver.parse( parser_stream );
   std::cout << "Done with parse!!\n";
   /* just in case raise parse error stream to flush it if there are any */
   
   raise( PARSE_ERR_SIG );
   return( EXIT_SUCCESS );
}
