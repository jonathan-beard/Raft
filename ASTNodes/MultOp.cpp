/**
 * MultOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "MultOp.hpp"

using namespace Node;

MultOp::MultOp() : MathOp( "MultOp" )
{
   class_tree.addRelation( typeid( Node::MathOp ).hash_code(),
                           typeid( Node::MultOp ).hash_code() );
}
