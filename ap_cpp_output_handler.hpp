/**
 * ap_cpp_output_handler.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jul  7 18:24:28 2013
 */
#ifndef _AP_CPP_OUTPUT_HANDLER_HPP_
#define _AP_CPP_OUTPUT_HANDLER_HPP_  1
#include <vector>
#include <cstdint>
#include <cinttypes>

namespace AP{

struct File{
   File( std::string name ) : lineno( 0 ),
                              filename( name ){};
   int64_t     lineno;
   std::string filename;
};

class AP_CPP_OutputHandler{
public:
   AP_CPP_OutputHandler();
   ~AP_CPP_OutputHandler();

   void  AddUpdate( int64_t      lineno, 
                    std::string  name, 
                    int8_t       flag );

   void  AddUpdate( int64_t      lineno,
                    std::string  name );
private:
   std::vector< File >  cpp_access_queue; 
};

} /* end namespace AP */

#endif /* END _AP_CPP_OUTPUT_HANDLER_HPP_ */
