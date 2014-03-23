/**
 * ArraySize.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  9 14:40:36 2014
 */
#include "ArraySize.hpp"

using namespace Node;

ArraySize::ArraySize( uint64_t dimension ) : Value< uint64_t >( dimension )
{
   class_tree.addRelation( typeid( Node::Value<uint64_t> ).hash_code(),
                           typeid( Node::ArraySize ).hash_code() );

}
