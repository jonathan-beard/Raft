/**
 * UIntType.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 27 14:03:20 2013
 */
#include "UIntType.hpp"

using namespace Node;

UIntType::UIntType() : Type(),
                       max( 0 ),
                       min( 0 )
{
   /* nothing to do here */
}

UIntType::~UIntType()
{
   /* nothing to do here either */
}

bool
UIntMax::IsType( uintmax_t value )
{
   if( value <= max && value >= min ) return( true );
   return( false );
}
