/**
 * DefaultVisitor.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#include <iostream>
#include <cassert>

#include "DefaultVisitor.hpp"
#include "NodeAbstract.hpp"

#include "data.hpp"

using namespace Visitor;
using namespace Node;

/* static indent variable */
int64_t DefaultVisitor::indent_level = 0;

DefaultVisitor::DefaultVisitor(Raft::Data &d) : 
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
DefaultVisitor::VisitChildren( NodeAbstract &node )
{
   NodeAbstract &child( node->get_child() );
   if( node.has_child() ) /* by def child is in siblings list */
   {
      auto &child( node->get_child() );
      /* for pretty print */
      increase_indent();
      auto &siblings( child.get_siblings() );
      for( NodeAbstract &sib : siblings )
      {
         sib->Accept( (*this) );
      }
      /* for pretty print */
      decrease_indent();   
   }
}

void 
DefaultVisitor::Error( std::string s )
{
   data.get_rf_errorstream() << s << std::endl;
}

void
DefaultVisitor::increase_indent()
{
   indent_level++;
}

void 
DefaultVisitor::decrease_indent()
{
   indent_level--;
}

std::string
DefaultVisitor::get_indent_level()
{
   std::stringstream ss;
   for( int64_t index(0); index < indent_level; index++ )
   {
      ss << "   ";
   }
   return( ss.str() );
}
