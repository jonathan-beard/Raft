/**
 * BooleanType.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include <cassert>
#include "BooleanType.hpp"

BooleanType::BooleanType() : Type()
{
   /* nothing to do here */
}

BooleanType::~BooleanType()
{
   Type::~Type();
}

bool
BooleanType::IsType( int64_t value )
{
   if( value == 0 || value == 1 ) return true;
   return( false );
}

bool
BooleanType::IsType( std::string *value )
{
   assert( value != nullptr );
   if( *value == "true"  || *value == "false" )
   {
      return( true );
   }
   return( false );
}

