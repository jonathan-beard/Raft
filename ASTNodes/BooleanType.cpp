/**
 * BooleanType.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include <cassert>
#include "BooleanType.hpp"

using namespace Node;

BooleanType::BooleanType() : Type("BooleanType")
{
   /* nothing to do here */
}

BooleanType::~BooleanType()
{
   Type::~Type();
}

bool
BooleanType::IsType( uintmax_t value )
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

Initializer*
BooleanType::GetDefaultInitializer()
{
   Initializer *out( nullptr );
   out = new Initializer( (bool)false );
   assert( out != nullptr );
   return( out );
}
