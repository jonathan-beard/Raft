/**
 * NodeAbstract.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 09:20:17 2013
 */
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
   type = new Type();
}

/* copy constructor */
NodeAbstract::NodeAbstract( const NodeAbstract &node )
{
   node_number = node.node_number;
   parent = node.parent;
   child  = node.child;
   siblings.insert( node.siblings.begin(), node.siblings.end() );
   type.set( node.type );
}


/* destructors */
NodeAbstract::~NodeAbstract()
{
   if( child != nullptr )
   {
      delete( child );
      child = nullptr;
   }
   foreach( NodeAbstract *node : siblings )
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
   Siblings all;
   /* this sibling should already have the same siblings as all its sibs */
   const Siblings &sib_siblings( sib->siblings ); 
   /* the same goes for this guy */
   const Siblings &my_siblings( this->siblings );
   /* get all siblings nodes */
   for_each( sib_siblings.begin(),
             sib_siblings.end(),
             [&]( NodeAbstract *sib ){ all.insert( sib ); } );
   /* get my nodes */
   for_each( my_siblings.begin(),
             my_siblings.end(),
             [&]( NodeAbstract *sib ){ all.insert( sib ); } );
   /* get all nodes & update all siblings */
   for( NodeAbstract *node : all )
   {
      node->siblings.insert( all.begin(), all.end() );
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
      this->child->MakeSiblings( node ); 
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

void           NodeAbstract::get_parent()
{
   return( this->parent );
}

Siblings&      NodeAbstract::get_siblings()
{
   return( siblings );
}

NodeAbstract*  NodeAbstract::get_child()
{
   return( this->child );
}

const Type&    NodeAbstract::get_type()
{
   return( *(this->type) );
}

void           NodeAbstract::set_type( const Type *type )
{
   assert( type != nullptr );
   /* trivial stupid case where two types
    * are the same mem location
    */
   if( this->type == type ) return;
   /* if we're changing the type then get rid of the 
    * one that's here
    */
   if( this->type != nullptr ) delete( this->type );
   /*
    * set the type to new ptr 
    */
   this->type = type;
}  

const std::string&      NodeAbstract::get_name()
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

void  NodeAbstract::Accept( DefaultVisitor &visitor )
{
   visitor->visit( this );
}

void  NodeAbstract::invoke( DefaultVisitor &visitor,
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
