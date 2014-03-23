/**
 * DivOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "DivOp.hpp"

using namespace Node;

DivOp::DivOp() : MathOp( "DivOp" )
{
   class_tree.addRelation( typeid( Node::MathOp ).hash_code(),
                           typeid( Node::DivOp ).hash_code() );
}
