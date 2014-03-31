/**
 * ap_cpp_output_handler.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jul  7 18:24:28 2013
 */
#ifndef _CPP_OUTPUT_HANDLER_HPP_
#define _CPP_OUTPUT_HANDLER_HPP_  1
#include <vector>
#include <cstdint>
#include <cinttypes>
#include <string>
#include <ostream>
#include <fstream>
#include <iostream>
#include <sstream>

#include "FindLine.hpp"
#include "common.hpp"

namespace Raft{

class Data;

struct File{
   File( std::string name ) : lineno( 0 ),
                              filename( name ){};

   
   File( int64_t n, 
         std::string name ) : lineno( n ),
                              filename( name ){};
   
   File( const File &f )
   {
      lineno = f.lineno;
      filename   = f.filename; 
   }
   
   std::ostream&  print( std::ostream &stream )
   {
      stream << "filename \"" << filename << "\" around line (" << (lineno) << ")";
      return( stream );
   }

   bool  SameFile( const std::string name )
   {
      const int8_t equal( 0 );
      return( filename.compare( name ) == equal );
   }

   /**
    * GetCurrentLine - returns the current line as a string, 
    * takes in a valid data struct to check for the proper
    * color coding, at the moment this is ignored but will
    * be added in the future.
    * @param   d  - Data&
    * @return  std::string
    */
   std::string GetCurrentLine( Data &d )
   {
      assert( filename.compare( "" ) != 0 );
#if(0)
      std::ifstream input;
      input.open( filename, std::ifstream::in );
      int64_t curr_line( 0 );
      std::string line;
      while( ++curr_line <= lineno && input.good() )
      {
         std::getline( input, line );
      }
      input.close();
#endif
      std::string current_parse_stream( d.get_rf_parsestream().str() );
      
      std::string line( FindLine::findLine( filename,
                                            lineno,
                                            current_parse_stream ) );
      d.reset_rf_parsestream();
      return( line );
   }
   
   int64_t     lineno;
   std::string filename;
};

/**
 * CPP_OutputHandler - simple class to handle
 * the C Pre-processors output format for the parser,
 * encapsulates everything through the AddUpdate
 * methods.  Callers should interact by using the 
 * AddUpdate to update the current file from the parser
 * and use the IsHeadIncluded file to see if the current
 * file was included from some other file.  The 
 * PeekBelowHead method offers a way to get the place
 * in the previous file from which this file was included,
 * the Peek Head method gives a way to look at the current
 * file and the current line number.
 */
class CPP_OutputHandler{
public:
   /* public constructor */
   CPP_OutputHandler( Data &d );
   /* public destructor */
   virtual ~CPP_OutputHandler();

   /**
    * AddUpdate - for use to update internal data structures
    * when a new pragma is reached in the C Pre-processor output.
    * This particular function is for use when the pragma has a 
    * flag associated with it.
    *
    * @param   lineno - int64_t
    * @param   name   - name
    * @param   int8_t - CPP flag
    */
   void  AddUpdate( int64_t      lineno, 
                    std::string  name, 
                    int8_t       flag );

   /**
    * AddUpdate - for use to update internal data structures
    * when a new pragma is reached in the C Pre-Processor output.
    * This particular function is for use when the pragma has no
    * flags associated with it.
    * 
    * @param   lineno - int64_t
    * @param   name   - name
    */
   void  AddUpdate( int64_t      lineno,
                    std::string  name );

   /**
    * IncrementHead - increments the file that is at the head.  
    * Useful when the parser increments lines within the 
    * cpp output.  These updates will be reflected in the 
    * various Peek() methods below.
    */
   void  IncrementHead();
   
   /**
    * IsHeadIncludedFile - returns true if the current head of 
    * the internal data structure is an included file from another
    * file.
    * @return  bool - true if head is an included file
    */
   bool  IsHeadIncludedFile();

   /**
    * PeekBelowHead - returns the text representation of line number
    * and file name of the file below the current head.  This method
    * is useful is the current head is an included file and there is 
    * an error in head, it might be useful for the user to know where
    * the file was included from.
    * @return  std::string    -  representation of the file below head
    */
   std::string PeekBelowHead();
   
   /**
    * PeekHead - returns a text representation of the line number
    * and file name of the file at head.
    * @return  std::string    - representation of the file at head
    */
   std::string PeekHead();

   std::string GetHeadCurrentLine();

   bool  IsComment();
   void  StartComment();
   void  EndComment();

protected:
   virtual void  add_file_object( File *f );
   virtual bool  has_head();
   virtual File& get_head();
   virtual bool  has_below_head();
   virtual File& get_below_head();
   virtual void  remove_head();
private:
   std::vector< File* >  cpp_access_queue; 
   bool  comment;
   Data &data;
};

} /* end namespace AP */

#endif /* END _CPP_OUTPUT_HANDLER_HPP_ */
