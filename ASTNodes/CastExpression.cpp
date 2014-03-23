/**
 * CastExpression.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan 25 07:25:06 2014
 */
#include "CastExpression.hpp"

using namespace Node;

CastExpression::CastExpression() : Expression( "CastExpression" )
{
   class_tree.addRelation( typeid( Node::Expression ).hash_code(),
                           typeid( Node::CastExpression ).hash_code() );
}


CastExpression::CastExpression( const std::string name ) : Expression( name )
{
   class_tree.addRelation( typeid( Node::Expression ).hash_code(),
                           typeid( Node::CastExpression ).hash_code() );
}
