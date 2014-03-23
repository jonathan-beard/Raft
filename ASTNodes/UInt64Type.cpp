/**
 * UInt64Type.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 27 19:14:28 2013
 */
#include "UInt64Type.hpp"

using namespace Node;

UInt64Type::UInt64Type() : UIntType(
                           "UInt64Type" ) 
{
   class_tree.addRelation( typeid( Node::UIntType ).hash_code(),
                           typeid( Node::UInt64Type ).hash_code() );

}
