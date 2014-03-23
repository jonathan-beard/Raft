/**
 * Operation.cpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 10 08:33:48 2014
 */
#include "Operation.hpp"

using namespace Node;

Operation::Operation() : NodeAbstract( "Operation" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Operation ).hash_code() );
}

Operation::Operation( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Operation ).hash_code() );
}
