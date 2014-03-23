/**
 * UIntType.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 27 14:03:20 2013
 */

#include "UIntType.hpp"

using namespace Node;

UIntType::UIntType() : Type( "UIntType" )
{
   class_tree.addRelation( typeid( Node::Type ).hash_code(),
                           typeid( Node::UIntType ).hash_code() );
}


UIntType::UIntType( const std::string name ) : Type( name )
{
   class_tree.addRelation( typeid( Node::Type ).hash_code(),
                           typeid( Node::UIntType ).hash_code() );
}
