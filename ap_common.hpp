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
private:
   AP_Common(){};
   ~AP_Common(){};

};

} /* end namespace AP */
#endif /* END _AP_COMMON_HPP_ */
