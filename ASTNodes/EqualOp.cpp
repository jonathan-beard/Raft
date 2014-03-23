/**
 * EqualOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "EqualOp.hpp"

using namespace Node;

EqualOp::EqualOp() : CondOp( "EqualOp" )
{
   class_tree.addRelation( typeid( Node::CondOp ).hash_code(),
                           typeid( Node::EqualOp ).hash_code() );
}
