/**
 * GreaterEqualOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "GreaterEqualOp.hpp"

using namespace Node;

GreaterEqualOp::GreaterEqualOp() : CondOp( "GreaterEqualOp" )
{
   class_tree.addRelation( typeid( Node::CondOp ).hash_code(),
                           typeid( Node::GreaterEqualOp ).hash_code() );
}
