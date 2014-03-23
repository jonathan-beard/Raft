/**
 * LessThanOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "LessThanOp.hpp"

using namespace Node;

LessThanOp::LessThanOp() : CondOp( "LessThanOp" )
{
   class_tree.addRelation( typeid( Node::CondOp ).hash_code(),
                           typeid( Node::LessThanOp ).hash_code() );
}
