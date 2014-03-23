/**
 * CondOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "CondOp.hpp"

using namespace Node;

CondOp::CondOp() : Operation( "CondOp" )
{
   class_tree.addRelation( typeid( Node::Operation ).hash_code(),
                           typeid( Node::CondOp ).hash_code() );
}


CondOp::CondOp( const std::string name ) : Operation( name )
{
   class_tree.addRelation( typeid( Node::Operation ).hash_code(),
                           typeid( Node::CondOp ).hash_code() );
}
