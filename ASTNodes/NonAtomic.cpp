/**
 * NonAtomic.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Jan  7 12:52:01 2014
 */
#include "NonAtomic.hpp"
using namespace Node;

NonAtomic::NonAtomic() : StorageModifier( "NonAtomic" )
{
   class_tree.addRelation( typeid( Node::StorageModifier ).hash_code(),
                           typeid( Node::NonAtomic ).hash_code() );

}
