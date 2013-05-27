/**
 * IntType.cpp - 
 * @author: Jonathan Beard
 * @version: Sun May 26 14:20:07 2013
 */
#include "IntType.hpp"

using namespace Node;

IntType::IntType() : Type()
{
   /* nothing to do here */
}

IntType::~IntType()
{
   /* nothing to do here either */
}

bool
IntType::IntIsType( int64_t value, int64_t min, int64_t max )
{
   if( value <= max && value >=min ) return( true );
   return( false );
}
