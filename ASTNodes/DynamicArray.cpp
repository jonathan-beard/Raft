/**
 * DynamicArray.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  2 14:47:18 2014
 */
#include "DynamicArray.hpp"

using namespace Node;

DynamicArray::DynamicArray() : TypeModifier( "DynamicArray" )
{
   class_tree.addRelation( typeid( Node::TypeModifier ).hash_code(),
                           typeid( Node::DynamicArray ).hash_code() );
}
