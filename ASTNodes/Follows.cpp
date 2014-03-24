/**
 * Follows.cpp - 
 * @author: Jonathan Beard
 * @version: Mon Mar 24 12:21:22 2014
 */
#include "Follows.hpp"

using namespace Node;

Follows::Follows() : NodeAbstract( "Follows" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code() ,
                           typeid( Node::Follows ).hash_code() );
}

Follows::Follows( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code() ,
                           typeid( Node::Follows ).hash_code() );
}
