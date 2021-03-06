/**
 * ap_common.hpp - 
 * @author: Jonathan Beard
 * @version: Mon May 20 13:20:59 2013
 */
#ifndef _COMMON_HPP_
#define _COMMON_HPP_  1
namespace Raft{

class Common{
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

static std::string GetFileNameFromPath( const char *Path,
                                        bool &status );

/**
 * ExtractPathNoFileName - Extracts the path from the full
 * path that included the filename.
 * @param   path - const std::string
 * @return  std::string - just the path, no filename
 */
static std::string ExtractPathNoFileName( const std::string path );

static std::string ExtractPathNoFileName( const char* Path, bool &status );

/**
 * RemoveStringQuotes - removes the quotes from strings like this: "boo boo boo"
 * so that the bare characters are returned as a std::string object.
 * @param   str - char *, must not be null
 * @return  std::string
 */
static void RemoveStringQuotes( std::string &str );

private:
   Common(){};
   ~Common(){};

};

} /* end namespace Raft */
#endif /* END _COMMON_HPP_ */
