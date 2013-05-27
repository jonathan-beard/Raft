/**
 * Int8Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include <cstdint>
#include "Int8Type.hpp"

Int8Type::Int8Type() : IntType()
{
   /* nothing to do here */
}

Int8Type::~Int8Type()
{
}

bool 
Int8Type::IsType( int64_t value )
{
   return( IntIsType( value, INT8_MIN, INT8_MAX ) );
}
