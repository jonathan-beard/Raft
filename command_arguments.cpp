/**
 * CmdArgs - A very simple command line arguments src file, can be included
 * in C++ and C files using the appropriate function calls.  In order to 
 * use this to process your arguments simply do the following:
 * //create a CmdArgs object
 * CmdArgs *args = new CmdArgs(std::string(argv[0])); //sets program name for object
 * //define static variables for options
 * static bool myFirstOption = false; //assigning var gives default value
 * //add options to CmdArgs
 * cmd->addOption(new Option<bool>(&myFirstOption,"-mFO","An option"));
 * //general form of
 * cmd->addOption(new Option<type>(var mem location, text flag, text description));
 * //give cmd line args to CmdArgs
 * cmd->processArgs(argc,argv)
 * .....now you can use the variables as you see fit
 *
 * @author Jonathan Beard
 * @version Last modified 27 May 2012
 * @contact jbeard@wustl.edu
 */ 


#include <iostream>
#include <algorithm>
#include <queue>
#include <cassert>

#include "command_arguments.h"
#include "signalhooks.hpp"



CmdArgs::CmdArgs(const std::string n, Raft::Data &d)
   : name( n ),
     data( d )
{
  /* nothing to do here, move along */
}

CmdArgs::~CmdArgs(){}

void CmdArgs::printArgs(){
   char stars[81];
   memset(stars, '*', sizeof(char) * 81);
   stars[80] = '\0';
   std::cout << stars << std::endl;
   std::cout << "Options menu for: " << name << std::endl;
   for_each( options.begin(),
             options.end(),
             [&]( OptionBase *option ){ 
                  data.get_userstream() << 
                        option->toString() << std::endl; } );
   std::cout << "End Options" << std::endl;
   std::cout << stars << std::endl;
}


void 
CmdArgs::addOption(OptionBase *option){
   assert( option != nullptr );
   options.push_back(option);
}

void CmdArgs::processArgs(int argc, char **argv){
   std::queue< std::string > ignored_options;
   for(int i = 1 ; i < argc; i++)
   {
      for( auto it( options.begin() ); it != options.end(); ++it )
      {
       if( strcmp( /* given argument */ argv[i],
                   /* given flag     */ (*it)->get_flag().c_str() ) == 0 )
         {
            /* increment past flag */
          if(! (*it)->is_help() ) i++;
          const bool success( (*it)->setValue(  argv[i]  ) );
          if( success != true )
          {
             data.get_rf_errorstream() << "Invalid input for flag (" <<
                (*it)->get_flag() << ") : " << argv[i] << "\n";
             raise( TERM_ERR_SIG );
          }
          goto END;
       }
    }
      ignored_options.push( std::string( argv[i] ) );
      END:;
   }
   
   if(! ignored_options.empty() ){
      data.get_errorstream() << 
         "The following options were unknown and ignored: " << std::endl;
   }
   while(! ignored_options.empty() ){
      std::string option = ignored_options.front();
      ignored_options.pop();
      data.get_errorstream() << option << std::endl;
   }
}
