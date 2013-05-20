/**
 * app.cpp - Preprocesses the .ap file, see more rubust documentation in 
 * the header file.
 * @author: Jonathan Beard
 * @version: Mon Jan 28 15:14:22 2013
 * @last modified: JCB - Tue Apr 2 10:38 2013
 */
#include <cstdlib>
#include <cassert>
#include <sys/stat.h>
#include <errno.h>
#include <unistd.h>
#include <cstring>
#include "app.hpp"
#include "signalhooks.hpp"

#ifndef PIPE_BUFFER_SIZE
#define PIPE_BUFFER_SIZE 4096
#endif

#ifndef APBASE
#define APBASE "APBASE"
#endif

APP::APP( AP::AP_Data &d ) : data( d )
{
   locations.push_back( location_pwd );
   locations.push_back( location_home );
   locations.push_back( location_base );
}

APP::~APP(){};

bool APP::add_file( const std::string base_file )
{
   auto found( files.find( base_file ) );
   const bool already_in( found != files.end() );
   if( ! already_in ) files.insert( base_file );
   return( already_in );
}

bool APP::run( const std::string ap_file_path )
{
   /* get full path name to app */
   const auto last_sep( ap_file_path.find_last_of( "/" ) );
   const std::string app_path( ap_file_path.substr(0, last_sep ) );
   return( APP::process( app_path,
                         ap_file_path,
                         files,
                         verified_paths,
                         buffer,
                         data,
                         locations ) );
}

std::stringstream& APP::output()
{
   return( buffer );
}

std::set< std::string >& APP::get_file_list()
{
   return( files );
}

std::map< std::string, std::string >& APP::get_include_paths()
{
   return( verified_paths );
}

bool  APP::process(  const std::string app_path,
                     const std::string ap_file_path,
                     std::set< std::string > &files,
                     std::map< std::string, std::string > &verified_paths,
                     std::stringstream &buffer,
                     AP::AP_Data &data, 
                     std::vector< LocationFunction > &locations )
{
   bool error( false );
   /* get all custom files */
   for( const std::string &str : files ){
      const auto length( str.length() );
      char *buffer_file( nullptr );
      buffer_file = (char*) malloc( sizeof( char ) * length );
      assert( buffer_file != nullptr );
      memset( buffer_file, '\0', length );
      char *buffer_ext( nullptr );
      buffer_ext = (char*) malloc( sizeof( char ) * length );
      assert( buffer_ext != nullptr );
      memset( buffer_ext, '\0', length );
      const auto num_read( sscanf( str.c_str() , 
                                   "%[^.].%s", 
                                   buffer_file, 
                                   buffer_ext ) );
      if( num_read != 2 ){
         data.get_ap_errorstream() << "No file extension detected in input (";
         data.get_ap_errorstream() << str << ").\n";
         error = true;
      }
      if( error ) raise( TERM_ERR_SIG );
      
      /* check each possible location for file */
      for( LocationFunction function : locations ){
         std::string full_path;
         std::string include_path;
         if( function( app_path, 
                       buffer_file, 
                       buffer_ext, 
                       full_path, 
                       include_path ) ){
            /* add to verified files list */
            const std::string kernel_name(
                  str.substr(0,
                        str.find_last_of( "." ) ) );
            verified_paths.insert( std::make_pair(  
                                          kernel_name /* block name */, 
                                          include_path ) );
         }
      }
      free( buffer_file );
      free( buffer_ext );
   }
   
   /* time to call the cpp */
   std::stringstream cmd_buffer;
   const std::string cmd_head( "cpp -nostdinc" );
   cmd_buffer << cmd_head << " ";

   for(const std::pair< std::string, std::string > &path_pair : 
         verified_paths )
   {
      cmd_buffer << "-I" << path_pair.second << " ";
   }

   cmd_buffer << ap_file_path;
   errno = 0;
   fflush( nullptr );
   FILE *cpp_pipe( popen( cmd_buffer.str().c_str(), "r" ) );
   if( cpp_pipe == nullptr ){
      data.get_ap_errorstream() << 
            "Failed to execute pipe for cpp, exited with ";
      data.get_ap_errorstream() << 
         "error code: " << strerror( errno ) << "\n";
      raise( TERM_ERR_SIG );
   }
   const size_t buffer_size( PIPE_BUFFER_SIZE );
   char pipe_buffer[ buffer_size + 1 ];
   memset( pipe_buffer, '\0', buffer_size + 1 );

   if( fread( pipe_buffer, 
              sizeof( char ), 
              buffer_size, 
              cpp_pipe ) <= 0 )
   {
      pclose( cpp_pipe );
      return( false );
   }

   for( ;; )
   {
      buffer << pipe_buffer;
      fflush( cpp_pipe );
      errno = 0;
      const auto num_read( fread( pipe_buffer,
                           sizeof( char ),
                           buffer_size,
                           cpp_pipe ) );
      if( num_read <= 0 ) break;
      if( errno != 0 )
      {
         data.get_ap_errorstream() << 
               "Error while reading from pipe, fread exited ";
         data.get_ap_errorstream() << 
            "with error code: " << strerror( errno ) << "\n";
         raise( TERM_ERR_SIG );
      }
      /* null terminate string */
      pipe_buffer[ num_read ] = '\0';
   }
   pclose( cpp_pipe );
   return( true );
}

bool APP::location_pwd( const std::string app_path,
                        const char *filename,
                        const char *ext,
                        std::string &full_path,
                        std::string &include_path )
{
   char *cwd( nullptr );
   cwd = getcwd( nullptr, 0 );
   assert( cwd != nullptr );
   std::stringstream full_path_stream;
   std::stringstream include_path_stream;
   full_path_stream << cwd << "/" << filename << "." << ext;

   include_path_stream << cwd << "/";

   full_path = full_path_stream.str();

   include_path = include_path_stream.str();
   free( cwd );
   return( APP::check_file( full_path ) );
}

bool APP::location_home( const std::string app_path,
                         const char *filename,
                         const char *ext,
                         std::string &full_path,
                         std::string &include_path )
{
   std::stringstream full_path_stream;
   std::stringstream include_path_stream;
   /* fix up full path problem */
   /* first char should be a slash, if not relative to cwd */
   if( app_path[0] != '/' ){
      /* append cwd path to it since its relative to cwd */
      char *cwd( nullptr );
      cwd = getcwd( nullptr, 0 );
      assert( cwd != nullptr );
      full_path_stream << cwd << "/";
      include_path_stream << cwd << "/";
      free( cwd );
   }
   /* these should all be full absolute path names now */
   full_path_stream << app_path << "/" << filename << "-dir" << "/";
   full_path_stream << filename << "." << ext;
   full_path = full_path_stream.str();
   
   include_path_stream << app_path << "/" << filename << "-dir" << "/";
   include_path = include_path_stream.str();
   return( APP::check_file( full_path ) );
}

bool APP::location_base( const std::string app_path,
                         const char *filename,
                         const char *ext,
                         std::string &full_path,
                         std::string &include_path )
{
   char *base( nullptr );
   base = getenv( APBASE ); 
   if( base != nullptr ){
      std::stringstream full_path_stream;
      full_path_stream << base << "/base/" << filename << "." << ext;
      full_path = full_path_stream.str();
      std::stringstream include_path_stream;
      include_path_stream << base << "/base/";
      include_path = include_path_stream.str();
      return( APP::check_file( full_path ) );
   }else{
      return( false );
   }
}


bool APP::check_file( const std::string filename ) 
{
   struct stat st;
   memset(&st, 0, sizeof(struct stat));
   if(stat(filename.c_str(), &st) != 0){
      return(false);
   }
   return( S_ISREG( st.st_mode ) ||
           S_ISFIFO( st.st_mode ) ||
           S_ISLNK( st.st_mode ) );
}
