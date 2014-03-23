/**
 * UInt8Type.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 27 19:14:28 2013
 */
#include "UInt8Type.hpp"

using namespace Node;

UInt8Type::UInt8Type() : UIntType(
                         "UInt8Type" )
{
   class_tree.addRelation( typeid( Node::UIntType ).hash_code(),
                           typeid( Node::UInt8Type ).hash_code() );
   /* nothing to do */
}
