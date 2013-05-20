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
#include "command_arguments.h"


CmdArgs::CmdArgs(const std::string n, AP_Data &d)
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
   for_each( vInt.begin(),
       vInt.end(),
       [&](Option<int64_t> *x){ std::cout << x->toString() << std::endl;});
   
   for_each( vDouble.begin(),
             vDouble.end(),
       [&](Option<double> *x){ std::cout << x->toString() << std::endl;});
   
   for_each( vBool.begin(),
             vBool.end(),
      [&](Option<bool> *x){ std::cout << x->toString() << std::endl;});

   for_each( vString.begin(),
             vString.end(),
             [&](Option<std::string> *x){ std::cout << 
                                          x->toString() << 
                                          std::endl;});

   std::cout << "End Options" << std::endl;
   std::cout << stars << std::endl;
};

/* TODO make more generic later */
void CmdArgs::addOption(Option<int64_t> *option){
   assert( option != nullptr );
   vInt.push_back(option);
}

void CmdArgs::addOption(Option<bool> *option){
   assert( option != nullptr );
   vBool.push_back(option);
}

void CmdArgs::addOption(Option<std::string> *option){
   assert( option != nullptr );
   vString.push_back(option);
}

void CmdArgs::addOption(Option<double> *option){
   assert( option != nullptr );
   vDouble.push_back(option);
}

void CmdArgs::processArgs(int argc, char **argv){
   std::queue<std::string> ignored_options;
   for(int i = 1 ; i < argc; i++){
      
      for( auto it( vInt.begin() ); it != vInt.end(); ++it){
         if(strcmp( /* given argument */ argv[i], /* given flag */ (*it)->getFlag() ) == 0){
            const int64_t value = strtoll( argv[++i], NULL, 10);
            (*it)->setValue( value ); 
            goto END;
         }
      }
      for(auto it( vBool.begin()); it != vBool.end(); ++it){
         if(strcmp( argv[i] , (*it)->getFlag() ) == 0){
            bool input = false;
            if( (*it)->isHelp() ){
               input = true;
            }else{
               if( (i+1) >= argc) break;
               if(strcmp( argv[i+1] , "true" ) == 0){
                  input = true;
               }else if( strcmp( argv[i+1] , "false" ) == 0){
                  input = false;
               }else{
                  std::stringstream ss;
                  for( jnt j = 1; j < argc; j++ )
                     ss << argv[j] << " ";
                  data.get_ap_errorstream() << 
                     "Invalid input at processArgs, check input!! \n" <<
                     "Given: " << ss.str() << "\n";
                     "Exiting!!\n";
                  raise( TERM_ERR_SIG );
               }
            }
            ++i;
            (*it)->setValue(input);
            goto END;
         }  
      }
      for(auto it(vString.begin()); it != vString.end(); ++it){
         if( strcmp( argv[i] , (*it)->getFlag() ) == 0){
            (*it)->setValue( argv[i+1] );
            ++i;
            goto END;
         }
      }
      ignored_options.push( std::string( argv[i] ) );
      END:;

   }
   
   if(! ignored_options.empty() ){
      std::cerr << 
         "The following options were unknown and ignored: " << std::endl;
   }
   while(! ignored_options.empty() ){
      std::string option = ignored_options.front();
      ignored_options.pop();
      std::cerr << option << "\n";
   }
}
