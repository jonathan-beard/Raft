/**
 * Generic.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan  2 15:35:18 2014
 */
#include "Generic.hpp"

using namespace Node;

Generic::Generic() : NodeAbstract( "Generic" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Generic ).hash_code() );

}

Generic::Generic( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Generic ).hash_code() );

}
