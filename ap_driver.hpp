#ifndef _APDRIVER_HPP_
#define _APDRIVER_HPP_

#include <vector>

#include "ap_scanner.hpp"
#include "ap_parser.tab.hh"
#include "NodeAbstract.hpp"
#include "DefaultVisitor.hpp"

class AP_Data;

namespace AP{

class AP_Driver{
public:
   AP_Driver( AP_Data &d );
   virtual ~AP_Driver();

   void parse( const char *filename );
   void parse( std::istringstream &iss );

   void set_root( Node::NodeAbstract *node );

   void RegisterVisitor( Visitor::DefaultVisitor *visitor );
   void InvokeVisitors();

private:
   void parse_error( int errorcode, int retval );
   
   AP::AP_Parser  *parser;
   AP::AP_Scanner *scanner;
   AP::AP_Data    &data;
   Node::NodeAbstract *root;

   std::vector< Visitor::DefaultVisitor* >  visitor_list;
};

} /* end namespace AP */

#endif /* END _APDRIVER_HPP_ */
