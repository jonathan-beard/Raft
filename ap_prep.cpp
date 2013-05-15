/**
 * xprep.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 30 12:46:53 2013
 */
#include <vector>
#include <sstream>
#include <iostream>
#include <cassert>
#include <fstream>
#include <iterator>
#include <algorithm>
#include <cstring>

#include "ap_prep.hpp"
#include "signalhooks.hpp"

std::set< std::string >*
AP_Prep::get_ap_includes ( const std::string main_ap,
                          AP_Data &data )
{
   std::set< std::string > *ret_val( nullptr );
   std::ifstream in_file( main_ap.c_str(), std::ifstream::in );
   if( in_file.is_open() ){
      ret_val = new std::set< std::string >();
      std::string line;
      while( in_file.good() ){
         std::getline( in_file, line );
         auto *tokens( AP_Prep::get_tokens( line ));
         assert( tokens != nullptr );
         std::string filename;
         if( AP_Prep::is_ap_file( (*tokens), filename ) ){
            ret_val->insert( filename ); 
         }
      }
   }else{
      /* error */
      data.get_ap_errorstream() << 
         "Unable to open file: " << main_ap << "\n";
      raise( TERM_ERR_SIG );
   }

   return( ret_val );
}


std::vector<std::string>* 
AP_Prep::get_tokens( const std::string &line )
{
   std::istringstream iss( line );
   std::vector< std::string > *ret_val( nullptr );
   ret_val = new std::vector< std::string >();
   std::copy( std::istream_iterator< std::string >(iss),
              std::istream_iterator< std::string> (),
              std::back_inserter< std::vector< std::string > >(*ret_val));
   return( ret_val );
}

bool
AP_Prep::is_ap_file( std::vector< std::string > &tokens,
                     std::string  &filename )
{
   if( tokens.size() != 2 ) return( false );
   /* we're looking for 2 tokens */
   for( int i = 0; i < 2; i++){
      switch( i ){
         case( 0 ) :
         {
            if( tokens[0].compare( "#include" )  != 0){
               return( false );
            }
         }  
         break;
         case( 1 ) :
         {  
            std::string &str( tokens[1] );
            const auto length( str.length() );
            char *buffer_name( nullptr );
            buffer_name = (char*) malloc( sizeof( char ) * length );
            assert( buffer_name != nullptr );
            char *buffer_ext( nullptr );
            buffer_ext = (char*) malloc( sizeof( char ) * length );
            assert( buffer_ext != nullptr );
            const auto num_read = sscanf( str.c_str(), 
                                          "\"%[^.].%[^\"]",
                                          buffer_name,
                                          buffer_ext );

            if( num_read != 2 ) return( false );
            /* if we're here go ahead and set filename */
            std::stringstream ss;
            ss << buffer_name << "." << buffer_ext;
            filename = ss.str();
            /* don't need this anymore */
            free( buffer_name ); 
            if( strcmp( buffer_ext, (char*) "ap" ) != 0 ){
               free( buffer_ext );
               return( false );
            }
            free( buffer_ext );
         }
         break;
         default:
            return( false );
      }
   }
   return( true );
}
