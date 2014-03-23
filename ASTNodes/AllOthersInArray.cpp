/**
 * AllOthersInArray.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Feb 13 09:12:25 2014
 */
#include "AllOthersInArray.hpp"

using namespace Node;

AllOthersInArray::AllOthersInArray() : Value<uint64_t>( 0 )
{
   class_tree.addRelation( typeid( Node::Value<uint64_t> ).hash_code(),
                           typeid( Node::AllOthersInArray ).hash_code() );
}
