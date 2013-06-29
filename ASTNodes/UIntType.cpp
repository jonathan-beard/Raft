/**
 * UIntType.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 27 14:03:20 2013
 */
#include "UIntType.hpp"
#include "Initializer.hpp"

using namespace Node;


UIntType::UIntType() : Type( "UIntType" ),
                       max( 0 ),
                       min( 0 )
{
   /* nothing to do here */
}

UIntType::UIntType( const std::string n, 
                    uintmax_t maximum ) : Type( n ),
                                          max( maximum ),
                                          min( 0 )
{
   /* nothing to do here */
}


UIntType::~UIntType()
{
   /* nothing to do here either */
}

bool
UIntType::IsType( uintmax_t value )
{
   if( value <= max && value >= min ) return( true );
   return( false );
}

Initializer*
UIntType::GetDefaultInitializer()
{
   return( new Initializer( (uintmax_t) 0 ) );
}
