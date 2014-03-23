/**
 * HatOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "HatOp.hpp"

using namespace Node;

HatOp::HatOp() : BitOperation( "HatOp" )
{
   class_tree.addRelation( typeid( Node::BitOperation ).hash_code(),
                           typeid( Node::HatOp ).hash_code() );
}
