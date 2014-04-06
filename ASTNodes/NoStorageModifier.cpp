/**
 * NoStorageModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Apr  3 08:51:05 2014
 */
#include "NoStorageModifier.hpp"

using namespace Node;

NoStorageModifier::NoStorageModifier() : StorageModifier("NoStorageModifier")
{
   class_tree.addRelation( typeid( Node::StorageModifier ).hash_code(),
                           typeid( Node::NoStorageModifier ).hash_code() );
}
