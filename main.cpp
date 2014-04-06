/**
 * main.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Feb 15 15:52:31 2013
 */
#include <iostream>
#include <cstdlib>
#include <cassert>

#include "command_arguments.h"
#include "data.hpp"
#include "prep.hpp"
#include "options_vars.hpp"
#include "set_options.hpp"
#include "p.hpp"
#include "driver.hpp"
#include "common.hpp"
#include "signalhooks.hpp"

/* visitors */
#include "DebugVisitor.hpp"
#include "SymtabVisitor.hpp"
Raft::Data raft_data;

static void 
parse_handler( int signal )
{
   std::stringstream errstream;
   raft_data.PrintErrors( errstream );
   const std::string err_str( errstream.str() );
   if( err_str.length() > 1 )
   {
      std::cerr << "The following errors were detected:\n";
      std::cerr << err_str << "\n";
   }
   raft_data.reset_rf_errorstream();
}

static void 
term_error_handler( int signal )
{
   std::stringstream errstream;
   raft_data.PrintErrors( errstream );
   const std::string err_str( errstream.str() );
   if( err_str.length() > 1 )
   {
      std::cerr << "The following errors were detected:\n";
      std::cerr << err_str << "\n";
   }
   raft_data.reset_rf_errorstream();
   exit( EXIT_FAILURE );
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
   Options_Vars options;
   raft_data.set_options_vars( &options );
   
   /* Get a Cmd State Object & Set Options */
   CmdArgs cmd_args( argv[0] , raft_data );
   
   Set_Options::SetOptions( cmd_args, raft_data );
   
   /* only one argument, print menu and exit */
   if( argc == 1 )
   {
      cmd_args.printArgs();
      exit( EXIT_SUCCESS );
   }
   /* process arguments */
   cmd_args.processArgs( argc, argv );
   /* if help argument is true */
   if( options.help )
   {
      cmd_args.printArgs();
      exit( EXIT_SUCCESS );
   }
   /* check to see if the input file name was set */
   if( options.is_string_default( options.input_filename ) )
   {
      std::cerr << "User must select at least one autopipe " << 
                   "file for processing (-f)!!" << "\n";
      exit( EXIT_FAILURE );
   }
   /* get a pre-processor object */
   Preprocessor p( raft_data );
   /* get the included file to feed to pre-processor */ 
   auto *files( 
      Prep::get_rf_includes( options.input_full_path , raft_data ) );
   assert( files != nullptr );
   /* setup dump include file list */
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
      p.add_file( str );
   }
   delete( files );
   if( options.dump_include_file_list )
   {
      const std::string include_dump_file( 
         "dump_include_" + options.input_filename );
      Raft::Common::Dump( (*dump_include_list).str(), 
                           include_dump_file );
      delete( dump_include_list );
      dump_include_list = nullptr;
   }
   assert( dump_include_list == nullptr );
   p.run( options.input_full_path );
   std::stringstream &cpp_output( p.output() );
   if( options.dump_cpp_output )
   {
      const std::string cpp_dump_filename( 
            "dump_cpp_" + options.input_filename );
      Raft::Common::Dump( cpp_output.str(), cpp_dump_filename ); 
   }



   auto &paths( p.get_include_paths() );
   for( std::pair< std::string, std::string> str : paths ){
      std::cout << str.first << " - " << str.second << std::endl; 
   }


   std::istringstream parser_stream( cpp_output.str() );
 
   Raft::Driver driver( raft_data );

   /* REGISTER VISITORS HERE, IN THE ORDER YOU WANT THEM CALLED */
   driver.RegisterVisitor( new Visitor::DebugVisitor( raft_data ) );
   //driver.RegisterVisitor( new Visitor::SymtabVisitor( raft_data ) );
   /* END REGISTER VISITORS */


   std::cout << "Parsing...\n";
   driver.parse( parser_stream );
   /* just in case raise parse error stream to flush it if there are any */
   raise( PARSE_ERR_SIG );
   std::cout << "Done parsing, visiting...\n";

   driver.InvokeVisitors();

   return( EXIT_SUCCESS );
}
