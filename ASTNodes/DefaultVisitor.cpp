/**
 * DefaultVisitor.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#include <iostream>
#include <cassert>

#include "DefaultVisitor.hpp"
#include "NodeAbstract.hpp"

#include "ap_data.hpp"

using namespace Visitor;
using namespace Node;


DefaultVisitor::DefaultVisitor(AP::AP_Data &d) : 
                               data( d )
{
   /* nothing else to construct at the moment */
}

DefaultVisitor::DefaultVisitor( const DefaultVisitor &visitor ) :
                                data( visitor.data )
{
   /* not much to copy at the moment */
}

DefaultVisitor::~DefaultVisitor()
{
   /* nothing to destroy :( */
}

void 
DefaultVisitor::VisitChildren( NodeAbstract *node )
{
   assert( node != nullptr );
   NodeAbstract *child( node->get_child() );
   if( child == nullptr ) return;
   else /* by def child is in siblings list */
   {
      auto &siblings( child->get_siblings() );
      for( NodeAbstract *sib : siblings )
      {
         assert( sib != nullptr );
         sib->Accept( (*this) );
      }
   }
}

void 
DefaultVisitor::Error( std::string s )
{
   data.get_ap_errorstream() << s << std::endl;
}
