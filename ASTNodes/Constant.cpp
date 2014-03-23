/**
 * Constant.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Jan  7 12:52:01 2014
 */
#include "Constant.hpp"

using namespace Node;

Constant::Constant() : StorageModifier( "Constant" )
{
   class_tree.addRelation( typeid( Node::StorageModifier ).hash_code(),
                           typeid( Node::Constant ).hash_code() );

}
