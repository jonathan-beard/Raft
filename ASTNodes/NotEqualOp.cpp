/**
 * NotEqualOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "NotEqualOp.hpp"

using namespace Node;

NotEqualOp::NotEqualOp() : CondOp( "NotEqualOp" )
{
   class_tree.addRelation( typeid( Node::CondOp ).hash_code(),
                           typeid( Node::NotEqualOp ).hash_code() );
}
