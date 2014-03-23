/**
 * UInt16Type.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 27 19:14:28 2013
 */
#include "UInt16Type.hpp"

using namespace Node;

UInt16Type::UInt16Type() : UIntType( "UInt16Type")
{
   class_tree.addRelation( typeid( Node::UIntType ).hash_code(),
                           typeid( Node::UInt16Type ).hash_code() );
   /* nothing else to do here */
}
