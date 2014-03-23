/**
 * UInt32Type.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 27 19:14:28 2013
 */
#include "UInt32Type.hpp"

using namespace Node;

UInt32Type::UInt32Type() : UIntType(
                           "UInt32Type" )
{
   class_tree.addRelation( typeid( Node::UIntType ).hash_code(),
                           typeid( Node::UInt32Type ).hash_code() );
   /* nothing to do here */
}
