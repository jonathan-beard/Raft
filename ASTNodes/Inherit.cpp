/**
 * Inherit.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan  3 16:13:49 2014
 */
#include "Inherit.hpp"

using namespace Node;

Inherit::Inherit() : NodeAbstract( "Inherit" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Inherit ).hash_code() );

}

Inherit::Inherit( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Inherit ).hash_code() );

}
