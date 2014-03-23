/**
 * Body.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 10:51:37 2014
 */
#include "Body.hpp"

using namespace Node;

Body::Body() : NodeAbstract( "Body" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Body ).hash_code() );

}

Body::Body( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Body ).hash_code() );

}
