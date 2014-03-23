/**
 * TypeCastExpression.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Feb 12 07:18:09 2014
 */
#include "TypeCastExpression.hpp"

using namespace Node;

TypeCastExpression::TypeCastExpression() : CastExpression( "TypeCastExpression" )
{
   class_tree.addRelation( typeid( Node::CastExpression ).hash_code(),
                           typeid( Node::TypeCastExpression ).hash_code() );

}
