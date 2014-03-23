/**
 * LeftShiftOp.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Feb 12 06:02:36 2014
 */
#include "LeftShiftOp.hpp"

using namespace Node;

LeftShiftOp::LeftShiftOp() : BitOperation( "LeftShiftOp" )
{
   class_tree.addRelation( typeid( Node::BitOperation ).hash_code(),
                           typeid( Node::LeftShiftOp ).hash_code() );
}
