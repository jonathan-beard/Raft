/**
 * IntType.cpp - 
 * @author: Jonathan Beard
 * @version: Sun May 26 14:20:07 2013
 */

#include "IntType.hpp"

using namespace Node;

IntType::IntType() : Type( "IntType" )
{
   class_tree.addRelation( typeid( Node::Type ).hash_code(),
                           typeid( Node::IntType ).hash_code() );
}


IntType::IntType( const std::string name ) : Type( name )
{
   class_tree.addRelation( typeid( Node::Type ).hash_code(),
                           typeid( Node::IntType ).hash_code() );
}
