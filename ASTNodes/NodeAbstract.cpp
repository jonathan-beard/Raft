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
#include <algorithm>
#include "DefaultVisitor.hpp"
#include "NodeAbstract.hpp"
#include "Type.hpp"
#include "data.hpp"
#include "cpp_output_handler.hpp"

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
   /* set parent to self, this is b/c we need all the nodes
    * parent to point to the same thing so when we adopt 
    * we only have to change one pointer value 
    */
   parent = this;
}

NodeAbstract::NodeAbstract( const std::string n ):
                           name( n ),
                           node_number( NodeAbstract::number_of_nodes++ ),
                           parent( nullptr ),
                           child( nullptr )
{
   /* set parent to self, this is b/c we need all the nodes
    * parent to point to the same thing so when we adopt 
    * we only have to change one pointer value 
    */
   parent = this;
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
   assert( this->parent != nullptr );

   siblings.insert( sib );
   sib->siblings.insert( this );

   auto &sib_siblings( sib->siblings ); 
   /* make sure each node has all siblings */
   siblings.insert( sib_siblings.begin(), sib_siblings.end() );
   sib_siblings.insert( siblings.begin(), siblings.end() ); 

   /* update parents to this nodes parent */
   for_each( sib_siblings.begin(), sib_siblings.end(), 
             [&]( NodeAbstract *n ){ n->set_parent( this->parent ); } );
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

bool
NodeAbstract::has_sibling()
{
   return( siblings.size() != 0 );
}  

NodeAbstract&  
NodeAbstract::get_first_sibling()
{
   return( *( *siblings.begin() ) );
}

void           NodeAbstract::set_parent( NodeAbstract *parent )
{
   assert( parent != nullptr );
   this->parent = parent;
}

NodeAbstract& 
NodeAbstract::get_parent()
{
   return( *(this->parent) );
}

std::set<NodeAbstract* >&      
NodeAbstract::get_siblings()
{
   return( siblings );
}

NodeAbstract&  
NodeAbstract::get_child()
{
   return( *(this->child) );
}

bool
NodeAbstract::has_child()
{
   return( (this->child) != nullptr );
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

bool
NodeAbstract::has_parent()
{
   return( parent != nullptr );
}

std::ostream&
NodeAbstract::print( std::ostream &stream)
{
   auto &the_parental_unit( get_parent() );
   std::stringstream the_parent_name;
   if( ! the_parental_unit.has_parent() )
   {
      the_parent_name << "None";
   }
   else
   {
      the_parent_name << the_parental_unit.get_number();
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
   
   (&visitor)->Visit( *this );
}

void 
NodeAbstract::SetOrigin( Raft::Data &d )
{
   file_details.name      = d.get_cpp_handler().PeekHead();
   file_details.line_text = d.get_cpp_handler().GetHeadCurrentLine();
}

void  
NodeAbstract::invoke( Visitor::DefaultVisitor &visitor,
                      NodeAbstract   &root )
{  
   /**
    * technically we could work around this, but will probably be
    * easier for students using Crafting a Compiler and the
    * Aho/Lam/Sethi/Ullman Compilers book to recognize and modify
    * this visitor pattern.
    */
   root.Accept( visitor );
}
