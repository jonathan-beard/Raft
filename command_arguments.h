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


#ifndef __CMDARGS_H__
#define __CMDARGS_H__

#ifdef __cplusplus
/* C++ includes */
#include <cstdlib>

#ifdef __APPLE__ /* apple doesn't have the most up to date c++ headers */
#ifndef _GLIBCXX_USE_C99_STDINT_TR1
#define _GLIBCXX_USE_C99_STDINT_TR1
#endif
#include <tr1/cstdint>
#ifndef _GLIBCXX_USE_C99_INTTYPES_TR1
#define _GLIBCXX_USE_C99_INTTYPES_TR1
#endif
#include <tr1/cinttypes>
#else
#include <cinttypes>
#include <cstdint>
#endif

#include <typeinfo>
#include <cstring>
#include <sstream>
#include <vector>
#include <iostream>
#else
/* C includes */
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#endif


#ifndef TERM_WIDTH
#define TERM_WIDTH 80
#endif

#ifndef FLAG_WIDTH
#define FLAG_WIDTH 30
#endif

#ifdef __cplusplus

#include "ap_data.hpp"

/**
 * Option - simple template for options to be added to the 
 * given program.
 */
template <class T> class Option{
   public:
      /**
       * Default Constructor - 
       * @param in - T& a reference to the location of the variable
       *             to be set.
       * @param flag - std::string, flag you want to have associated
       *               with this variable
       * @param description - std::string, description of the variable
       *                      to be set, will be printed
       * @param help        - bool, set by default to false tells CmdArg
       *                      that this variable is a help flag so it
       *                      gets special treatment.
       */
      Option(T &in, 
             std::string flag, 
             std::string description,
             bool help = false) :
         item(in) , _flag(flag), _description(description), _help(help){};

      virtual ~Option(){};
      bool isHelp(){ return ( _help ); };
      const char* getFlag(){ return( _flag.c_str() ); };
      void setValue(T value){ item = value; }; 

      std::string toString(){
         const size_t total_width( TERM_WIDTH );
         const size_t flag_width( FLAG_WIDTH );
         std::stringstream s;
         s.flags(std::ios::left);
         s.width(flag_width);
         s << _flag;
         s.flags(std::ios::right);
         
         /* format the description + default properly */
         const size_t description_width( total_width - flag_width );
         std::stringstream desc;
         desc << "// " << _description << ", default: " << format_item( item );
         const std::string desc_str( desc.str() );
         if(desc_str.length() > description_width){
            /* width needs to be shortened and made multi-line */
            char *space_buffer = (char*) malloc(sizeof(char) * flag_width + 4);
            if(space_buffer == (char*)NULL){ 
               perror("Failed to initialize space buffer!!");
               exit( EXIT_FAILURE );
            }
            memset( space_buffer, 0x20 /* space */, sizeof(char) * 
                                                      (flag_width + 4 ) );
            space_buffer[ flag_width + 3 ] = '\0'; /* NULL term */ 
            size_t char_count(1);
            for( std::istringstream iss( desc_str ); iss.good();)
            {
               std::string curr_token;
               iss >> curr_token;
               char_count += ( curr_token.length() + 1 /* space */ );
               if( char_count > description_width ){
                  s << "\n";
                  s << space_buffer;
                  char_count = 1;
               }
               s << curr_token << " ";
            }
            free( space_buffer );
         }else{
            /* it fits */
            s << desc_str;
         }
         return s.str();
      };

   private:

      std::string format_item( T x ){
         std::stringstream out;
         out << x;
         if( typeid(x) == typeid(bool) ){
            if( *((bool*)(&x))  == true){
               return("true");
            }else{
               return("false");
            }
         }else if( typeid(x) == typeid(double) ){
            char buffer[100];
            memset(buffer, '\0', sizeof(char) * 100);
            snprintf(buffer, 100, "%0.3f", *((double*)(&x)));
            std::stringstream ss;
            ss << buffer;
            return( ss.str() );
         }
         /* this should be the string case */ 
         return( out.str() );
      }

      bool _help;
      T &item;
      std::string _flag;
      std::string _description;
};

/**
 * CmdArgs - actual cmd args class
 */
class CmdArgs{
   public:
      /**
       * Default Constructor - 
       * @param   name - std::string, name of program using CmdArgs
       * @param   d  - AP::AP_Data&, for error streams
       */
      CmdArgs(std::string name, AP::AP_Data &d);
      ~CmdArgs();
      /**
       * printArgs - print all the options
       */
      void printArgs();
      /**
       * addOption - each of these takes a ptr to an options
       * object, there is a method for int64_t, bool, std::string,
       * and double.  
       */
      void addOption(Option<int64_t> *option);
      void addOption(Option<bool> *option);
      void addOption(Option<std::string> *option);
      void addOption(Option<double> *option);
      /**
       * processArgs - to be called when all the options
       * are registered and you're ready to set the variables
       * @param   argc - int, with number of strings in _argv
       * @param   argv - char**, with list of strings from the
       * command line 
       */
      void processArgs(int argc, char **argv);
   private:
     
      std::vector<Option<int64_t>* >      vInt;
      std::vector<Option<bool>* >         vBool;
      std::vector<Option<std::string>* >  vString;
      std::vector<Option<double>* >       vDouble;

      std::string name;
      AP::AP_Data     &data;
};
#endif

#ifdef __cplusplus
extern "C" {
#endif
/**
 * getCmdArgs - returns a pointer to a C++ style CmdArgs object
 * @return  (void*) - ptr to CmdArgs object
 */
void* getCmdArgs();
/**
 * destroyCmdArgs - pass a valid CmdArgs object ptr cast as a 
 * void* ptr to this method and it'll free the object.
 * @param   (void*)  - ptr to CmdArgs object
 */
void  destroyCmdArgs(void *cmd_args);
/**
 * _printArgs - prints all registered cmd line args to param stream
 * @param   FILE output stream to print args to
 */
 void _printArgs(FILE stream);


 #ifdef __cplusplus
 } /* END EXTERN C DEFINE */
 #endif

 #endif /* END __CMDARGS_H__ */
