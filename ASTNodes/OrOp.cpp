/**
 * OrOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "OrOp.hpp"

using namespace Node;

OrOp::OrOp() : BitOperation( "OrOp" )
{
   class_tree.addRelation( typeid( Node::BitOperation ).hash_code(),
                           typeid( Node::OrOp ).hash_code() );
}
