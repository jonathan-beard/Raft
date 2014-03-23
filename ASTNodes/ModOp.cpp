/**
 * ModOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "ModOp.hpp"

using namespace Node;

ModOp::ModOp() : MathOp( "ModOp" )
{
   class_tree.addRelation( typeid( Node::MathOp ).hash_code(),
                           typeid( Node::ModOp ).hash_code() );

}
