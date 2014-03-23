/**
 * Expression.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Feb 12 12:39:59 2014
 */
#include "Expression.hpp"

using namespace Node;

Expression::Expression() : NodeAbstract( "Expression" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Expression ).hash_code() );
}


Expression::Expression( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Expression ).hash_code() );
}
