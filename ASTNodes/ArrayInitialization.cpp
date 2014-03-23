/**
 * ArrayInitialization.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Feb 13 09:01:07 2014
 */
#include "ArrayInitialization.hpp"

using namespace Node;

ArrayInitialization::ArrayInitialization() : NodeAbstract( "ArrayInitialization" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::ArrayInitialization ).hash_code() );
}


ArrayInitialization::ArrayInitialization( const std::string name )
   : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::ArrayInitialization ).hash_code() );
}
