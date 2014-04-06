/**
 * Synchronized.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Apr  3 09:01:21 2014
 */
#include "Synchronized.hpp"

using namespace Node;

Synchronized::Synchronized() : StorageModifier( "Synchronized" )
{
   class_tree.addRelation( typeid( Node::StorageModifier ).hash_code(),
                           typeid( Node::Synchronized ).hash_code() );
}
