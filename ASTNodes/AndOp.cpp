/**
 * AndOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "AndOp.hpp"

using namespace Node;

AndOp::AndOp() : BitOperation( "AndOp" )
{
   class_tree.addRelation( typeid( Node::BitOperation ).hash_code(),
                           typeid( Node::AndOp ).hash_code() );
}
