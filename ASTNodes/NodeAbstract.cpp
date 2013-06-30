/**
 * NodeAbstract.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 09:20:17 2013
 */
#include <cassert>
#include <algorithm>
#include <cstdint>
#include <typeinfo>
#include <iostream>
#include <sstream>
#include "DefaultVisitor.hpp"
#include "NodeAbstract.hpp"
#include "Type.hpp"

using namespace Node;

/* private static variables */
int64_t NodeAbstract::number_of_nodes = 0;

/* constructors */
NodeAbstract::NodeAbstract() : 
            name("NodeAbstract"),
            node_number( NodeAbstract::number_of_nodes++ ),
            parent( nullptr ),
            child( nullptr )
{
   /* nothing really to do here */
}

NodeAbstract::NodeAbstract( const std::string n ):
                           name( n ),
                           node_number( NodeAbstract::number_of_nodes++ ),
                           parent( nullptr ),
                           child( nullptr )
{
   /* nothing really to do here */
}
                           

/* copy constructor */
NodeAbstract::NodeAbstract( const NodeAbstract &node )
{
   node_number = node.node_number;
   parent = node.parent;
   child  = node.child;
   siblings.insert( node.siblings.begin(), 
                    node.siblings.end() );
}


/* destructors */
NodeAbstract::~NodeAbstract()
{
   for( NodeAbstract *node : siblings )
   {
      if( node != nullptr )
      {
          delete( node );
          node = nullptr;
      }
   }
   node_number -= 1;
   parent = nullptr;
}

void 
NodeAbstract::MakeSibling( NodeAbstract *sib )
{
   assert( sib != nullptr );
   siblings.insert( sib );
   sib->siblings.insert( this );

   auto &sib_siblings( sib->siblings ); 
   siblings.insert( sib_siblings.begin(), sib_siblings.end() );
   sib_siblings.insert( siblings.begin(), siblings.end() ); 
}


void NodeAbstract::AdoptChildren( NodeAbstract *node )
{
   assert( node != nullptr );
   if( this->child == nullptr )
   {
      
      this->child = node;
      /* new child should list itself as a sibling */
      this->child->set_parent( this );
      this->child->MakeSibling( node );
   }
   else
   {
      node->set_parent( this );
      this->child->MakeSibling( node ); 
   }
}

void NodeAbstract::Orphan()
{
   parent = nullptr;
   /* TODO decide if the siblings should go or stay */
}

NodeAbstract*  NodeAbstract::get_first_sibling()
{
   if( siblings.size() == 0 ) return( nullptr );
   return( ( *siblings.begin() ) );
}

void           NodeAbstract::set_parent( NodeAbstract *parent )
{
   assert( parent != nullptr );
   this->parent = parent;
}

NodeAbstract* NodeAbstract::get_parent()
{
   return( this->parent );
}

std::set<NodeAbstract* >&      
NodeAbstract::get_siblings()
{
   return( siblings );
}

NodeAbstract*  NodeAbstract::get_child()
{
   return( this->child );
}

int64_t
NodeAbstract::get_number()
{
   return( node_number );
}

std::string&      NodeAbstract::get_name()
{
   return( this->name );
}

void                    
NodeAbstract::set_name( const std::string name )
{
   this->name = name;
}


std::ostream&
NodeAbstract::print( std::ostream &stream)
{
   NodeAbstract *the_parental_unit( nullptr );
   the_parental_unit = get_parent();
   std::stringstream the_parent_name;
   if( the_parental_unit == nullptr )
   {
      the_parent_name << "None";
   }
   else
   {
      the_parent_name << the_parental_unit->get_number();
   }

   stream << "Node: " << get_number() << " - " << get_name();
   stream << " Parent: " << the_parent_name.str();
   return( stream );
}

std::string
NodeAbstract::ToString()
{
   std::stringstream ss;
   print(ss);
   return( ss.str() );
}

const std::type_info&
NodeAbstract::GetType() const
{
   return( typeid(*this) );
}

void  
NodeAbstract::Accept( Visitor::DefaultVisitor &visitor )
{
   visitor.Visit( this );
}

void  
NodeAbstract::invoke( Visitor::DefaultVisitor &visitor,
                      NodeAbstract   *root )
{  
   assert( root    != nullptr );
   /**
    * technically we could work around this, but will probably be
    * easier for students using Crafting a Compiler and the
    * Aho/Lam/Sethi/Ullman Compilers book to recognize and modify
    * this visitor pattern.
    */
   root->Accept( visitor );
}
