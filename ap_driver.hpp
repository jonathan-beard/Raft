#ifndef _APDRIVER_HPP_
#define _APDRIVER_HPP_

#include "ap_scanner.hpp"
#include "ap_parser.tab.hh"

class AP_Data;

namespace AP{

class AP_Driver{
public:
   AP_Driver( AP_Data &d );
   virtual ~AP_Driver();

   void parse( const char *filename );
   void parse( std::istringstream &iss );

private:
   void parse_error( int errorcode, int retval );
   
   AP::AP_Parser  *parser;
   AP::AP_Scanner *scanner;
   AP::AP_Data    &data;
};

} /* end namespace AP */

#endif /* END _APDRIVER_HPP_ */
