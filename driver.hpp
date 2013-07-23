#ifndef _DRIVER_HPP_
#define _DRIVER_HPP_

#include <vector>

#include "raft_scanner.hpp"
#include "raft_parser.tab.hh"
#include "NodeAbstract.hpp"
#include "DefaultVisitor.hpp"

class Data;

namespace Raft{

class Driver{
public:
   Driver( Data &d );
   virtual ~Driver();

   void parse( const char *filename );
   void parse( std::istringstream &iss );

   void set_root( Node::NodeAbstract *node );

   void RegisterVisitor( Visitor::DefaultVisitor *visitor );
   void InvokeVisitors();

private:
   void parse_error( int errorcode, int retval );
   
   Raft::Parser  *parser;
   Raft::Scanner *scanner;
   Raft::Data    &data;
   Node::NodeAbstract *root;

   std::vector< Visitor::DefaultVisitor* >  visitor_list;
};

} /* end namespace Raft */

#endif /* END _DRIVER_HPP_ */
