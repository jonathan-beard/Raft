/**
 * DefaultVisitor.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#include <iostream>
#include <cassert>

#include "DefaultVisitor.hpp"
#include "NodeAbstract.hpp"


DefaultVisitor::DefaultVisitor() : errstream( std::cerr )
{
   /* nothing else to construct at the moment */
}

DefaultVisitor::DefaultVisitor( const DefaultVisitor &visitor ) :
                                       errstream( visitor.errstream );
{
   /* not much to copy at the moment */
}

DefaultVisitor::~DefaultVisitor()
{
   /* nothing to destroy :( */
}

void DefaultVisitor::VisitChildren( NodeAbstract *node )
{
   assert( node != nullptr );
   NodeAbstract *child = node->get_child();
   if( child == nullptr ) return;
   else /* by def child is in siblings list */
   {
      for( NodeAbstract *sib : child->get_siblings )
      {
         sib->Accept( (*this) );
      }
   }
}

void DefaultVisitor::Error( std::string s )
{
   errstream << s << std::endl;
}