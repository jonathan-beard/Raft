/**
 * AP_Data.hpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 18 17:39:01 2013
 */
#ifndef _AP_DATA_HPP_
#define _AP_DATA_HPP_  1

#include <iostream>
#include <sstream>
#include <cassert>

/* for everybody else with C++11 */
#include <cstdint>

struct AP_Options_Vars;

/* type definition for autopipe errorstream */
typedef std::stringstream APErrorStream;
/* type definition for autopipe parse stream */
typedef std::stringstream APParseStream;

/* type definition for system error stream */
typedef std::ostream      ErrorStream;
/* typedefinition for system user stream */
typedef std::ostream      UserStream;


namespace AP{

class AP_CPP_OutputHandler;

/** 
 * AP_Data - class for various data elements that are used
 * throughput the AutoPipev3 compiler infrastructure
 */
class AP_Data {
public:
   /* constructor, initialize everything */
   AP_Data();
   /**
    * ~AP_Data - virtual destructor, deletes all dynamic data 
    * if allocated.
    */
   virtual        ~AP_Data();

   /**
    * Final - function to be called if terminate signal is 
    * thrown, will print all stored error messages and finish
    * deallocations
    */
   virtual  void  Final();
   
   /**
    * PrintErrors - method to print all errors, seamingly 
    * redundant with the get_XXX for each stream, however
    * the nice thing about this method is that it provides
    * a simple ostream so that the user can specify a custom
    * stream for the message to be printed to.
    * @param   stream   - std::ostream&
    * @return  std::ostream&
    */
   virtual  std::ostream&  PrintErrors( std::ostream &stream );

   /**
    * PrintParseErrors - method to print all parse specific errors, 
    * this one is also seemingly redundant, however it privdes
    * the std::ostream param so the user can specify which stream 
    * to print the error message to.
    * @param   stream - std::ostream&
    * @return  std::ostream&
    */
   virtual  std::ostream&  PrintParseErrors( std::ostream &stream );

   /**
    * reset_ap_parsestream - deallocates and resets the ap_parsestream
    * variable to nullptr.
    */
   void           reset_ap_parsestream();
   /**
    * get_ap_parsestream - returns a reference to an APParseStream,
    * this might now always be the same ap_parsestream reference 
    * if reset is called the current ap_parsestream is deallocated
    * @return APParseStream&
    */
   APParseStream&   get_ap_parsestream();
   
   /**
    * reset_ap_errorstream - resets the error stream.  If one is currently
    * allocated then the ap_errorstream is deallocated and set to nullptr
    */
   void           reset_ap_errorstream();
   /**
    * get_ap_errorstream - If the ap_errorstream is not allocated, this
    * method allcoates the ap_errorstream variable to a new APErrorStream
    * object and returns a reference to it.  This reference may chance,
    * if reset is called so callers should not expect it to stay constant.
    * @return APErrorStream&
    */
   APErrorStream& get_ap_errorstream();

   /**
    *  get_userstream - returs the system wide user stream for output,
    *  by default this is set to std::cout.
    *  @return APUserStream&
    */
   UserStream&   get_userstream();
   /**
    *  get_errorstream - returns the system wide error stream for output
    *  by default this is set to std::cerr
    *  @return ErrorStream&
    */
   ErrorStream&  get_errorstream();

   /**
    * set method for options vars, set should be called
    * at least once immediately after the options are set from
    * the command line or to defaults 
    * @param   vars - AP_Options_Vars ptr
    */
   void           set_options_vars( AP_Options_Vars *vars );
   /**
    * get_options_vars - set must be called before calling this
    * which is otherwise cought by an assertion.  This is a 
    * convenience method so you only have to provide one param
    * to most functions which is the whole data class.
    * @return  AP_Options_Vars&
    */
   AP_Options_Vars&  get_options_vars();

   /**
    * get_cpp_handler - returns a reference to the cpp handler
    * object for this parser
    * @return AP_CPP_OutputHandler&
    */
   AP_CPP_OutputHandler&   get_cpp_handler();

private:
   /* auto pipe parse stream, initially nullptr */
   APParseStream    *ap_parsestream;
   /* auto pipe error stream, initially nullptr */
   APErrorStream     *ap_errorstream;
   /* user (system) user stream, typically std::cout */
   UserStream        &userstream;
   /* user (system) error stream, typically std::cerr */
   ErrorStream       &errorstream;
   /* current parse file from parser, necessary for cpp */
   std::string       current_parse_file;
   /* current whole line, set from lexer */
   std::string       whole_current_line;
   /* global options */
   AP_Options_Vars   *options;
   /* cpp output handler */
   AP_CPP_OutputHandler *cpp_handler;
};

} /* end namespace AP */
#endif /* END _AP_DATA_HPP_ */
