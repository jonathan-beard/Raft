/**
 * UInt32Type.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 27 19:14:28 2013
 */
#include "UInt32Type.hpp"

using namespace Node;

UInt32Type::UInt32Type() : UIntType(),
                           type_name( "UInt32Type" ),
                           max( UINT32_MAX )
{
   /* nothing to do here */
}
