/**
 * DebugVisitor.cpp - 
 * @author: Jonathan Beard
 * @version: Fri May 24 08:00:53 2013
 */
#include  <iostream>
#include "DebugVisitor.hpp"
#include "NodeAbstract.hpp"

#include "ap_data.hpp"

using namespace Visitor;

DebugVisitor::DebugVisitor( AP::AP_Data &data ) : 
                            DefaultVisitor( data )
{
   /* nothing really to do here */
}

DebugVisitor::~DebugVisitor(){
   /* nothing really to do here either */
   DefaultVisitor::~DefaultVisitor();
}

void
DebugVisitor::Visit( Node::NodeAbstract *node )
{
   node->print( std::cout ) << std::endl;
   VisitChildren( node );
}
