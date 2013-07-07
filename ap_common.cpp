/**
 * ap_common.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 20 13:20:59 2013
 */
#include <cassert>
#include <string>
#include <fstream>
#include <iostream>
#include <sstream>

#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>

#include "ap_common.hpp"
#include "signalhooks.hpp"

using namespace AP;

void
AP_Common::Dump( const std::string &dump_str,
      const std::string &dump_file )
{
   assert( dump_file.length() > 0 );
   std::ofstream out_file( dump_file.c_str() );
   if( out_file.is_open() )
   {
      out_file << dump_str << "\n";
   }
   else
   {     
      std::cerr << "Error opening dumpfile: " << dump_file << "\n";
      out_file.close();
      raise( TERM_ERR_SIG );
   }  
   out_file.close();
}

bool 
AP_Common::MkDir( const std::string &dir )
{
   errno = EXIT_SUCCESS;
   if( mkdir( dir.c_str(), (S_IRWXU | S_IRWXG) ) == EXIT_FAILURE ){
      perror( "Error creating directory!!" );
      return(false);   
   }
   return(true);
}

std::string 
AP_Common::GetFileNameFromPath(std::string path, bool strip_ext)
{
   std::string last_file;
   size_t last_index = path.find_last_of('/');
   if(last_index != path.length()){
      last_file = path.substr(last_index + 1);
   }else
      last_file = path;
   if(strip_ext){
      std::stringstream ss;
      for(auto it(last_file.begin()); it != last_file.end(); ++it){
         if( (*it) == '.' ) break;
         else
            ss << (*it);      
      }
      last_file = ss.str();
   }
   return(last_file);
}

std::string 
AP_Common::GetFileNameFromPath(const char *Path, bool &status)
{
   bool strip_ext( false );
   std::string path( Path );
   std::string last_file;
   size_t last_index = path.find_last_of('/');
   if(last_index != path.length()){
      last_file = path.substr(last_index + 1);
   }else
      last_file = path;
   if(strip_ext){
      std::stringstream ss;
      for(auto it(last_file.begin()); it != last_file.end(); ++it){
         if( (*it) == '.' ) break;
         else
            ss << (*it);      
      }
      last_file = ss.str();
   }
   status = true;
   return(last_file);
}


std::string 
AP_Common::ExtractPathNoFileName(std::string path)
{
   std::string dir_path;
   size_t last_index = path.find_last_of('/');
   if(last_index <= path.length()){
      dir_path = path.substr(0, last_index);
   }else{
      dir_path  = "./";
   }      
   return(dir_path);
}

std::string 
AP_Common::ExtractPathNoFileName(const char *Path, bool &status)
{
   std::string path( Path );
   std::string dir_path;
   size_t last_index = path.find_last_of('/');
   if(last_index <= path.length()){
      dir_path = path.substr(0, last_index);
   }else{
      dir_path  = "./";
   }
   status = true;
   return(dir_path);
}

std::string
AP_Common::RemoveStringQuotes( const char *str )
{
   const auto length( strlen( str ) );
   char *buffer( nullptr );
   buffer = (char*) alloca( sizeof( char ) * length );
   assert( buffer != nullptr );
   memset( buffer, '\0', length );
   const auto num( sscanf( str, "\"%[^\"]\"", buffer ) );
   if( num == EOF )
   {
      return( "" );
   }else if( num == 0 )
   {
      return( "" );
   }
   else
   {
      std::stringstream ss;
      ss << buffer;
      return( ss.str() );
   }
}
