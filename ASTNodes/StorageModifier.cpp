/**
 * StorageModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Jan  7 12:49:04 2014
 */
#include "StorageModifier.hpp"

using namespace Node;

StorageModifier::StorageModifier() : Modifier()
{
   class_tree.addRelation( typeid( Node::Modifier ).hash_code(),
                           typeid( Node::StorageModifier ).hash_code() );
}


StorageModifier::StorageModifier( const std::string name ) : Modifier( name )
{
   class_tree.addRelation( typeid( Node::Modifier ).hash_code(),
                           typeid( Node::StorageModifier ).hash_code() );
}
