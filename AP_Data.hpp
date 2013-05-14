/**
 * AP_Data.hpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 18 17:39:01 2013
 */
#ifndef _AP_DATA_HPP_
#define _AP_DATA_HPP_  1

/* for std::cerr / std::cout */
#include <iostream>
/* for stream types */
#include <sstream>

/* for std::int types */
#ifdef __APPLE__
/* Apple's c++ headers are a bit stale */
#include <stdint.h>
#else
/* for everybody else with C++11 */
#include <cstdint>
#endif

/* type definition for autopipe errorstream */
typedef std::stringstream APErrorStream;
/* type definition for autopipe parse stream */
typedef std::stringstream APParseStream;

/* type definition for system error stream */
typedef std::ostream      ErrorStream;
/* typedefinition for system user stream */
typedef std::ostream      UserStream;


/** 
 * AP_Data - class for various data elements that are used
 * throughput the AutoPipev3 compiler infrastructure
 */
class AP_Data {
public:
   /* constructor, initialize everything */
   AP_Data() : ap_parsestream( nullptr ),
               ap_errorstream( nullptr ),
               userstream( std::cout ),
               errorstream( std::cerr ),
               current_line( 0 ){};
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
    * set_current_line - sets the current line number stored to the param
    * line number, this method is intended for synchronizing with the 
    * scanner.
    * @param   line_number - uint64_t
    */
   void           set_current_line( uint64_t line_number );
   /**
    * get_current_line - returns the current line number.
    * @return uint64_t
    */
   uint64_t       get_current_line();

private:
   /* auto pipe parse stream, initially nullptr */
   APParseStream    *ap_parsestream;
   /* auto pipe error stream, initially nullptr */
   APErrorStream     *ap_errorstream;
   /* user (system) user stream, typically std::cout */
   UserStream        &userstream;
   /* user (system) error stream, typically std::cerr */
   ErrorStream       &errorstream;
   /* the current line number, for use with scanner */
   uint64_t current_line;
};

#endif /* END _AP_DATA_HPP_ */