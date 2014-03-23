/**
 * Declaration.cpp - 
 * @author: Jonathan Beard
 * @version: Wed May 29 08:59:18 2013
 */
#include <cassert>
#include "Declaration.hpp"

using namespace Node;

Declaration::Declaration() : NodeAbstract( "Declaration" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Declaration ).hash_code() );

}

Declaration::Declaration( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Declaration ).hash_code() );

}
