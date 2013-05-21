/**
 * ap_common.hpp - 
 * @author: Jonathan Beard
 * @version: Mon May 20 13:20:59 2013
 */
#ifndef _AP_COMMON_HPP_
#define _AP_COMMON_HPP_  1
namespace AP{

class AP_Common{
public:
/**
 *  Dump - function to do basically what it says, used
 *  for dumping text to a file with the filename of 
 *  dump_location.  
 *  @param  dump_str - const std::string&, string to be dumped
 *  @param  dump_location - const std::string&, filename of dump
 */
static void Dump( const std::string &dump_str, 
                  const std::string &dump_location );

/**
 * MkDir - makes the directory specified at the path
 * in the param dir string.
 * @param   dir - const std::string&
 * @return  bool - true if successful
 */
static bool MkDir( const std::string &dir );

/**
 * GetFileNameFromPath - extracts the filename from the given
 * full path.  If you want the filename extension removed also
 * set the strip_ext param to true.
 * @param   path - std::string, full path including filename
 * @param   strip_ext - bool, set to true for ext removal
 * @return  std::string - bare filename
 */
static std::string GetFileNameFromPath( const std::string path,
                                        bool strip_ext = false );

/**
 * ExtractPathNoFileName - Extracts the path from the full
 * path that included the filename.
 * @param   path - const std::string
 * @return  std::string - just the path, no filename
 */
static std::string ExtractPathNoFileName( const std::string path );

private:
   AP_Common(){};
   ~AP_Common(){};

};

} /* end namespace AP */
#endif /* END _AP_COMMON_HPP_ */
