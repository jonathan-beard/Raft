/**
 * LessEqualOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "LessEqualOp.hpp"

using namespace Node;

LessEqualOp::LessEqualOp() : CondOp( "LessEqualOp" )
{
   class_tree.addRelation( typeid( Node::CondOp ).hash_code(),
                           typeid( Node::LessEqualOp ).hash_code() );
}
