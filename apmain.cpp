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
#include "ap_options_vars.hpp"
#include "ap_set_options.hpp"
#include "app.hpp"
#include "ap_driver.hpp"
#include "ap_common.hpp"
#include "signalhooks.hpp"


AP::AP_Data ap_data;

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

static void 
term_error_handler( int signal )
{
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
main( const int argc, char **argv )
{
   /* right now don't worry about arg counts */
   errno = 0;
   if( signal( PARSE_ERR_SIG, parse_handler ) == SIG_ERR )
   {
      perror( "Error setting parse_handler" );
      exit( EXIT_FAILURE );
   }
   
   /* right now don't worry about arg counts */
   errno = 0;
   if( signal( TERM_ERR_SIG, term_error_handler ) == SIG_ERR )
   {
      perror( "Error setting term_error_handler" );
      exit( EXIT_FAILURE );
   }

   /* set options object with defaults */
   AP_Options_Vars options;
   ap_data.set_options_vars( &options );
   
   /* Get a Cmd State Object & Set Options */
   CmdArgs cmd_args( argv[0] , ap_data );
   
   AP_Set_Options::SetOptions( cmd_args, ap_data );

   cmd_args.processArgs( argc, argv );
  
   if( options.help )
   {
      cmd_args.printArgs();
      exit( EXIT_SUCCESS );
   }

   if( options.is_string_default( options.input_filename ) )
   {
      std::cerr << "User must select at least one autopipe " << 
                   "file for processing (-f)!!" << "\n";
      exit( EXIT_FAILURE );
   }
   
   APP app( ap_data );

   auto *files( AP_Prep::get_ap_includes( options.input_filename , ap_data ) );
   assert( files != nullptr );
   std::stringstream *dump_include_list( nullptr );
   if( options.dump_include_file_list )
   {
      dump_include_list = new std::stringstream();
      assert( dump_include_list != nullptr );
   }
   for( const std::string &str : (*files) ){
      if( options.dump_include_file_list )
      {
         (*dump_include_list) << str << "\n";
      }
      app.add_file( str );
   }
   delete( files );
   if( options.dump_include_file_list )
   {
      const std::string include_dump_file( 
         "include_dump_" + options.input_filename );
      AP::AP_Common::Dump( (*dump_include_list).str(), 
                           include_dump_file );
      delete( dump_include_list );
   }

   app.run( options.input_filename );
   std::stringstream &cpp_output( app.output() );
   if( options.dump_cpp_output )
   {
      const std::string cpp_dump_filename( 
            "cpp_dump_" + options.input_filename );
      AP::AP_Common::Dump( cpp_output.str(), cpp_dump_filename ); 
   }


/*  
   std::set<std::string> &file_list( app.get_file_list() );
   auto &paths( app.get_include_paths() );
   for( std::pair< std::string, std::string> str : paths ){
      std::cout << str.first << " - " << str.second << std::endl; 
   }
*/
/*
   std::istringstream parser_stream( output.str() );
 
   AP::AP_Driver driver( ap_data );
   std::cout << "Calling parse!!\n";
   driver.parse( parser_stream );
   std::cout << "Done with parse!!\n";
*/   
   /* just in case raise parse error stream to flush it if there are any */
   
   raise( PARSE_ERR_SIG );
   return( EXIT_SUCCESS );
}
