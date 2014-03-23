/**
 * EmptyBlock.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 14:17:57 2014
 */
#include "EmptyBlock.hpp"

using namespace Node;

EmptyBlock::EmptyBlock() : Block( "EmptyBlock" )
{
   class_tree.addRelation( typeid( Node::Block ).hash_code(),
                           typeid( Node::EmptyBlock ).hash_code() );
}
