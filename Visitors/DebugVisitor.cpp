/**
 * DebugVisitor.cpp - 
 * @author: Jonathan Beard
 * @version: Fri May 24 08:00:53 2013
 */
#include  <iostream>
#include "DebugVisitor.hpp"
#include "NodeAbstract.hpp"

#include "data.hpp"

using namespace Visitor;

DebugVisitor::DebugVisitor( Raft::Data &data ) : 
                            DefaultVisitor( data )
{
   /* nothing really to do here */
}

DebugVisitor::~DebugVisitor()
{

}

void
DebugVisitor::Visit( Node::NodeAbstract &node, ClassTree &tree )
{
   std::cout << get_indent_level();
   node.print( std::cout ) << std::endl;
   VisitChildren( node );
}
