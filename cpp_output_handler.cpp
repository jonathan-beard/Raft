/**
 * ap_cpp_output_handler.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jul  7 18:24:28 2013
 */
#include <cassert>
#include <algorithm>
#include "data.hpp"
#include "signalhooks.hpp"
#include "cpp_output_handler.hpp"

using namespace Raft;

CPP_OutputHandler::CPP_OutputHandler( Data &d) :
                                                   comment( false ),
                                                   data( d )
{
   /* nothing really to do */
}

CPP_OutputHandler::~CPP_OutputHandler()
{
  for( File *f: cpp_access_queue )
  {
      /* call destructor */
      delete( f );
  }
}

void
CPP_OutputHandler::AddUpdate( int64_t     lineno,
                                 std::string name,
                                 int8_t      flag )
{
   /* handle all cases here */
   /**
    * flag == 1, start of new file
    * flag == 2, return to previous file
    * flag == 3, this is a system header file
    * flag == 4, text should be wrapped in explicit extern "C" 
    */
   enum flags { NEW = 1, RETURN, SYSTEM, EXTERN };
   switch( flag )
   {
      case( NEW ):
      {
         add_file_object( new File( lineno, name ) );
      }
      break;
      case( RETURN ):
      {
         remove_head();
         assert( has_head() == true );
         File &f( get_head() );
         f.lineno = (--lineno);
      }
      break;
      case( SYSTEM ):
      {
         /* unimplemented, I don't think we'll need this one */
      }
      break;
      case( EXTERN ):
      {
         /* unimplemented, I don't think we'll need this one */
      }
      break;
      default:
      {
         data.get_errorstream() << "Invalid input detected within "
            << "the output from the C Pre-Processor, suggest you re-"
            << "run with -dump_cpp_output true to debug." << std::endl;
         raise( TERM_ERR_SIG );
      }
   }
}  

void
CPP_OutputHandler::AddUpdate( int64_t     lineno,
                                 std::string name )
{
   /**
    * We want to ignore the following:
    * name eq "<built-in>"
    * name eq "<command-line>"
    */
   const int8_t equal(0);
   const std::string builtin( "<built-in>" );
   const std::string commandline( "<command-line>" );
   if( name.compare( builtin ) == equal )
   {
      /* ignore this guy */
   }
   else if( name.compare( commandline ) == equal )
   {
      /* ignore this one too */
   }
   else
   {
      /* this is the one we actually need to care about */
      /**
       * two cases to be handled, the first is if its a new file,
       * add it to the stack, the second is if we're looking at
       * an update to the line number via CPP, then we need to check
       * the name of head
       */
      if( /* no */! has_head() )
      {
         /* simply insert a new File object */
         add_file_object( new File( lineno, name ) );
      }
      else
      {
         File &f( get_head() );
         /* if CPP does its job correctly this will always be true */
         assert( f.SameFile( name ) == true );
         /* update line no */
         f.lineno = lineno;
      }
   }

}

void 
CPP_OutputHandler::IncrementHead()
{
   /* if no head, do nothing */
   if( has_head() == true )
   {
      File &f( get_head() );
      f.lineno++;
   }
}

bool
CPP_OutputHandler::IsHeadIncludedFile()
{
   return( has_below_head() );
}

std::string
CPP_OutputHandler::PeekBelowHead()
{
   assert( has_below_head() == true );
   std::stringstream ss;
   File &f( get_below_head() );
   f.print( ss );
   return( ss.str() );
}

std::string
CPP_OutputHandler::PeekHead()
{
   if( has_head() == true )
   {
      std::stringstream ss;
      File &f( get_head() );
      f.print( ss );
      return( ss.str() );
   }
   else
   {
      return( "" );
   }
}

std::string
CPP_OutputHandler::GetHeadCurrentLine()
{
   if( has_head() == true )
   {
      std::string output;
      File &f( get_head() );
      output = f.GetCurrentLine( data );
      return(output);
   }
   else
   {
      return( "Error, no current file!!" );
   }
}

bool
CPP_OutputHandler::IsComment()
{
   return( comment );
}

void
CPP_OutputHandler::StartComment()
{
   comment = true;
}

void
CPP_OutputHandler::EndComment()
{
   comment = false;
}

/**
 * below this line are accessor methods for the queue,
 * makes it a bit easier to swap data structures in the
 * future
 */

void
CPP_OutputHandler::add_file_object( File *f )
{
   assert( f != nullptr );
   cpp_access_queue.push_back( f );
}

bool
CPP_OutputHandler::has_head()
{
   return( cpp_access_queue.size() > 0 );
}

File& 
CPP_OutputHandler::get_head()
{
   assert( has_head() == true );
   return( *cpp_access_queue.back() );
}

bool
CPP_OutputHandler::has_below_head()
{
   return( cpp_access_queue.size() > 1 );
}

File&
CPP_OutputHandler::get_below_head()
{
   assert( has_below_head() == true );
   File *below_head( nullptr );
   below_head = *(cpp_access_queue.end() - 2);
   assert( below_head != nullptr );
   return( *below_head );
}

void
CPP_OutputHandler::remove_head()
{
   assert( has_head() == true );
   File *end( cpp_access_queue.back() );
   delete( end );
   cpp_access_queue.erase( --cpp_access_queue.end() );
}
