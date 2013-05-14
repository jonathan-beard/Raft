#ifndef _XDRIVER_HPP_
#define _XDRIVER_HPP_

#include "x_scanner.hpp"
#include "x_parser.tab.hh"

class Data;

namespace APParse{

class X_Driver{
public:
   X_Driver( Data &d );
   virtual ~X_Driver();

   void parse( const char *filename );
   void parse( std::istringstream &iss );

private:
   void parse_error( int errorcode, int retval );
   APParse::X_Parser *parser;
   APParse::X_Scanner *scanner;
   Data &data;
};

} /* end namespace APParse */

#endif /* END _XDRIVER_HPP_ */
