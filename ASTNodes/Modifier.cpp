/**
 * Modifier.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 12 06:44:01 2014
 */
#include "Modifier.hpp"
using namespace Node;

Modifier::Modifier() : NodeAbstract( "Modifier" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Modifier ).hash_code() );
}


Modifier::Modifier( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Modifier ).hash_code() );
}
