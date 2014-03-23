/**
 * BitOperation.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 16:15:17 2014
 */
#include "BitOperation.hpp"

using namespace Node;

BitOperation::BitOperation() : Operation( "BitOperation" )
{
   class_tree.addRelation( typeid( Node::Operation ).hash_code(),
                           typeid( Node::BitOperation ).hash_code() );
}


BitOperation::BitOperation( const std::string name ) : Operation( name )
{
   class_tree.addRelation( typeid( Node::Operation ).hash_code(),
                           typeid( Node::BitOperation ).hash_code() );
}
