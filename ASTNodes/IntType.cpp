/**
 * IntType.cpp - 
 * @author: Jonathan Beard
 * @version: Sun May 26 14:20:07 2013
 */
#include "IntType.hpp"

using namespace Node;

IntType::IntType() : Type(),
                     max( 0 ),
                     min( 0 )
{
   /* nothing to do here */
}

IntType::~IntType()
{
   /* nothing to do here either */
}

bool
IntType::IsType( uintmax_t value )
{
   const intmax_t real_value( value );
   if( real_value <= max && real_value >=min ) return( true );
   return( false );
}