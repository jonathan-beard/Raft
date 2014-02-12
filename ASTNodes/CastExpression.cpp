/**
 * CastExpression.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan 25 07:25:06 2014
 */
#include "CastExpression.hpp"

using namespace Node;

CastExpression::CastExpression() : Expression( "CastExpression" )
{
}


CastExpression::CastExpression( const std::string name ) : Expression( name )
{
}
