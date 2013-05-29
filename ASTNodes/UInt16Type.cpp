/**
 * UInt16Type.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 27 19:14:28 2013
 */
#include "UInt16Type.hpp"

using namespace Node;

UInt16Type::UInt16Type() : UIntType(),
                           type_name( "UInt16Type" ),
                           max( UINT16_MAX )
{
   /* nothing else to do here */
}
