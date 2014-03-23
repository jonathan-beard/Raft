/**
 * GreaterThanOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "GreaterThanOp.hpp"

using namespace Node;

GreaterThanOp::GreaterThanOp() : CondOp( "GreaterThanOp" )
{
   class_tree.addRelation( typeid( Node::CondOp ).hash_code(),
                           typeid( Node::GreaterThanOp ).hash_code() );
}
