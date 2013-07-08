/**
 * app.hpp - This is the "new" ap-pre processor
 * calling it reasults in a nice single file 
 * representation on which to call the ap-language
 * lexer and parser.  The ENV variable APBASE must 
 * point to the base directory for the AP language
 * parser which contains the folder "base"
 * NOTE: you can chance the name of APBASE for the 
 * environment variable at compile time by adding
 * the flag -DAPBASE="xxx" where "xxx" is to be replaced
 * by the new environment name to look for.
 *
 * @author: Jonathan Beard
 * @version: Mon Jan 28 15:14:22 2013
 */
#ifndef _APP_HPP_
#define _APP_HPP_  1

#include <set>
#include <map>
#include <vector>
#include <sstream>
#include <string>

#include "ap_data.hpp"

class APP{
public:
   APP( AP::AP_Data &d );
   virtual ~APP();

   /**
    * add_file - adds a file to the list to pre-process,
    * this file is searched for in both the current working
    * directory and the base directory, otherwise an error 
    * is thrown.  Basically use this if for some reason there
    * is a custom file not in the standard path.
    *
    * @param base_file - const std::string
    * @return  bool - false if already added
    */
   bool add_file( const std::string base_file );

   bool run( const std::string base_path );

   /**
    * get_files - returns a representation of the files given
    * to it within the add_files calls as a single string 
    * @return std::stringstream&
    */
   std::stringstream& output();

   /**
    * below are misc. accessor methods that might be useful 
    * at some point in the future, especially for debugging
    */
    std::set< std::string >& get_file_list();
   
    std::map< std::string, std::string >& get_include_paths();

private:
   typedef bool   (*LocationFunction)(const std::string app_path,
                                      const char *filename, 
                                      const char *ext,
                                      std::string &full_path,
                                      std::string &include_path );
   
   static bool  process( const std::string         app_path,
                         const std::string         ap_file_path,
                    std::set< std::string >   &files, 
                    std::map< std::string , std::string > &verified_paths,
                    std::stringstream         &buffer,
                    AP::AP_Data &data,
                    std::vector< LocationFunction > &locations );


   static bool location_pwd( const std::string app_path,
                             const char *filename,
                             const char *ext,
                             std::string &full_path,
                             std::string &include_path );

   static bool location_home( const std::string app_path,
                              const char *filename, 
                              const char *ext,
                              std::string &full_path,
                              std::string &include_path );

   static bool location_base( const std::string app_path,
                              const char *filename, 
                              const char *ext,
                              std::string &full_path,
                              std::string &include_path );

   static bool check_file( const std::string filename );



   std::set< std::string >                      files;
   std::map< std::string, std::string >         verified_paths; 
   std::stringstream                            buffer;
   std::vector< LocationFunction >              locations;
   AP::AP_Data                                      &data;
};
#endif /* END _APP_HPP_ */
