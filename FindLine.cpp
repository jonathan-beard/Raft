/**
 * FindLine.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Mar 30 07:55:15 2014
 */
#include "FindLine.hpp"
#include "common.hpp"
#include <iostream>
#include <fstream>
#include <queue>
#include <utility>
#include <sstream>

using namespace Raft;

std::string
FindLine::findLine( const std::string filename,
                    size_t expected_line,
                    const std::string phrase )
{
   std::queue< std::pair< size_t , std::string > > queue;
   
   /** first open file **/
   std::ifstream input( filename );
   std::string line;
   size_t current_line( 1 );
   if( input.is_open() )
   {
      while( std::getline( input, line ) )
      {
         if( queue.size() < 3 )
         {
            queue.push( std::make_pair( current_line, line ) );
         }
         else if( queue.size() == 3 )
         {
            /** get rid of the last one **/
            queue.pop();
            /** insert a new one **/
            queue.push( std::make_pair( current_line, line ) );
         }
         if( (current_line++) == (expected_line+1) )
         {
            break;
         }
      }
   }
   /** COLORS **/
   const std::string blue( "\033[1;36m" );
   const std::string normal( "\033[0m" );
   const std::string red( "\033[1;31m" );

    std::string onlyfilename( Common::GetFileNameFromPath( filename ) );

   std::stringstream ss;
   while( queue.size() > 0 )
   {
      auto pair( queue.front() );
      queue.pop();
      ss << red << onlyfilename << " " << pair.first << ": " << normal << pair.second << "\n";
   }

   /** then highlight with appropriate colors **/
 
   std::string text( ss.str() );

   size_t start_index(  text.find( phrase ) );
   size_t end_index(    text.find_first_not_of( phrase, start_index ) );


   std::string start( text.substr( 0,start_index ) );
   std::string end( text.substr( end_index ) );

   std::cout << start << blue << phrase << normal << end << "\n"; 

   input.close();
   return( "foo" );
}
