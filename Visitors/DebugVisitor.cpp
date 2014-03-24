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
   /* register needed visitors */
   const size_t hash_code( typeid( Node::NodeAbstract ).hash_code() );
   visit_methods.insert( std::make_pair( hash_code, DebugNodeAbstractVisit ) );
}

DebugVisitor::~DebugVisitor()
{

}

/**
 * DefaultNodeAbstractVisit - base visit method, does nothing but
 * accept the type.
 */
void
DebugVisitor::DebugNodeAbstractVisit( Node::NodeAbstract &node, Visitor::DefaultVisitor &visitor)
{
   std::cerr << visitor.get_indent_level();
   node.print( std::cerr ) << "\n";
   visitor.VisitChildren( node );
}

