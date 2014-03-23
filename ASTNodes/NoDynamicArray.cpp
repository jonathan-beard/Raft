/**
 * NoDynamicArray.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  2 17:07:47 2014
 */
#include "NoDynamicArray.hpp"

using namespace Node;

NoDynamicArray::NoDynamicArray() : TypeModifier( "NoDynamicArray" )
{
   class_tree.addRelation( typeid( Node::TypeModifier ).hash_code(),
                           typeid( Node::NoDynamicArray ).hash_code() );
}
