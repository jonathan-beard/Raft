/**
 * MathOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:39:23 2014
 */
#include "MathOp.hpp"

using namespace Node;

MathOp::MathOp() : Operation( "MathOp" )
{
   class_tree.addRelation( typeid( Node::Operation ).hash_code(),
                           typeid( Node::MathOp ).hash_code() );
}


MathOp::MathOp( const std::string name ) : Operation( name )
{
   class_tree.addRelation( typeid( Node::Operation ).hash_code(),
                           typeid( Node::MathOp ).hash_code() );
}
