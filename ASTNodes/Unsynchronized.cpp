/**
 * Unsynchronized.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Apr  3 09:01:21 2014
 */
#include "Unsynchronized.hpp"

using namespace Node;

Unsynchronized::Unsynchronized() : StorageModifier( "Unsynchronized" )
{
   class_tree.addRelation( typeid( Node::StorageModifier ).hash_code(),
                           typeid( Node::Unsynchronized ).hash_code() );
}
