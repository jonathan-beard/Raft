/**
 * NodeAbstract.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 09:20:17 2013
 */
#include <cassert>
#include <algorithm>
#include <cstdint>
#include "DefaultVisitor.hpp"
#include "NodeAbstract.hpp"

using namespace Node;

/* private static variables */
int64_t NodeAbstract::number_of_nodes = 0;

/* constructors */
NodeAbstract::NodeAbstract() : 
            node_number( NodeAbstract::number_of_nodes++ ),
            parent( nullptr ),
            child( nullptr ),
            name("NodeAbstract")
{
   /* nothing realy to do here */
}

/* copy constructor */
NodeAbstract::NodeAbstract( const NodeAbstract &node )
{
   node_number = node.node_number;
   parent = node.parent;
   child  = node.child;
   siblings.insert( siblings.end(),
                    node.siblings.begin(), 
                    node.siblings.end() );
   (this)->type.set_type( node.get_type() );
}


/* destructors */
NodeAbstract::~NodeAbstract()
{
   if( child != nullptr )
   {
      delete( child );
      child = nullptr;
   }
   for( NodeAbstract *node : siblings )
   {
      if( node != nullptr )
      {
          delete( node );
          node = nullptr;
      }
   }
   node_number = -1;
   parent = nullptr;
}

void NodeAbstract::MakeSibling( NodeAbstract *sib )
{
   assert( sib != nullptr );
   /* need to make siblings alike so we'll merge their sets */
   std::vector<NodeAbstract* >  all;
   /* this sibling should already have the same siblings as all its sibs */
   const auto &sib_siblings( sib->siblings ); 
   /* the same goes for this guy */
   const auto &my_siblings( this->siblings );
   /* get all siblings nodes */
   for_each( sib_siblings.begin(),
             sib_siblings.end(),
             [&]( NodeAbstract *sib ){ all.push_back( sib ); } );
   /* get my nodes */
   for_each( my_siblings.begin(),
             my_siblings.end(),
             [&]( NodeAbstract *sib ){ all.push_back( sib ); } );
   /* get all nodes & update all siblings */
   for( NodeAbstract *node : all )
   {
      node->siblings.insert( node->siblings.end(),
                             all.begin(), 
                             all.end() );
   }
}


void NodeAbstract::AdoptChildren( NodeAbstract *node )
{
   assert( node != nullptr );
   if( this->child == nullptr )
   {
      this->child = node;
   }
   else
   {
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
   return( siblings.front() );
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

std::vector<NodeAbstract* >&      NodeAbstract::get_siblings()
{
   return( siblings );
}

NodeAbstract*  NodeAbstract::get_child()
{
   return( this->child );
}

const Type&    NodeAbstract::get_type() const
{
   return( this->type );
}

void           NodeAbstract::set_type( const Type &type )
{
   this->type.set_type( type );
}  

int64_t
NodeAbstract::get_number()
{
   return( node_number );
}

const std::string&      NodeAbstract::get_name() const
{
   return( this->name );
}

void                    NodeAbstract::set_name( std::string name ) 
{
   this->name = name;
}
void                    NodeAbstract::set_name( const std::string &name )
{
   this->name = name;
}


std::ostream&
NodeAbstract::print( std::ostream &stream)
{
   stream << "Node: " << get_number() << " - " << get_name();
   return( stream );
}

void  NodeAbstract::Accept( Visitor::DefaultVisitor &visitor )
{
   visitor.Visit( this );
}

void  NodeAbstract::invoke( Visitor::DefaultVisitor &visitor,
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
