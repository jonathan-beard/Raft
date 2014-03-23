/**
 * Minus.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:39:23 2014
 */
#include "Minus.hpp"

using namespace Node;

Minus::Minus() : MathOp( "Minus" )
{
   class_tree.addRelation( typeid( Node::MathOp ).hash_code(),
                           typeid( Node::Minus ).hash_code() );
}
