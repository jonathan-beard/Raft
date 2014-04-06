/**
 * Atomic.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Apr  3 09:01:21 2014
 */
#include "Atomic.hpp"

using namespace Node;

Atomic::Atomic() : StorageModifier( "Atomic" )
{
   class_tree.addRelation( typeid( Node::StorageModifier ).hash_code(),
                           typeid( Node::Atomic ).hash_code() );
}
