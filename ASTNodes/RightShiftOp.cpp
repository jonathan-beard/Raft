/**
 * RightShiftOp.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Feb 12 06:02:36 2014
 */
#include "RightShiftOp.hpp"

using namespace Node;

RightShiftOp::RightShiftOp() : BitOperation( "RightShiftOp" )
{
   class_tree.addRelation( typeid( Node::BitOperation ).hash_code(),
                           typeid( Node::RightShiftOp ).hash_code() );
}
