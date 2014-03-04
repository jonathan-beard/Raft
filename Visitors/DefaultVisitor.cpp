/**
 * DefaultVisitor.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#include <iostream>
#include <cassert>
#include <typeinfo>
#include <utility>

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
   /** 
    * NOTE: add a visitor for the base node, can be overriden later
    * in derived classes if need be by removing the node in 
    * the tree and replacing it
    */
   const size_t hash_code( typeid( Node::NodeAbstract ).hash_code() );
   visit_methods.insert( std::make_pair( hash_code, DefaultNodeAbstractVisit ) );
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

/**
 * DefaultNodeAbstractVisit - base visit method, does nothing but
 * accept the type.
 */
void
DefaultVisitor::DefaultNodeAbstractVisit( Node::NodeAbstract &node )
{
   
}

void 
DefaultVisitor::Visit( Node::NodeAbstract &node, ClassTree &tree )
{
   const size_t hash_code( tree.getClosestTo( typeid( node ).hash_code(), visit_methods ) );
   if( hash_code == 0 )
   {
      data.get_errorstream() << 
         "No function found for (" << typeid( node ).name() << "), attempting to recover.\n";
      return;
   }
   /**
    * else get function, we know it exists so unless something really really bad happened,
    * this should work
    */
   auto func( visit_methods[ hash_code ] );
   func( node );
}

void 
DefaultVisitor::VisitChildren( NodeAbstract &node )
{
   if( node.has_child() ) /* by def child is in siblings list */
   {
      auto &child( node.get_child() );
      /* for pretty print */
      increase_indent();
      std::set<NodeAbstract* > &siblings( child.get_siblings() );
      for( NodeAbstract *sib : siblings )
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
