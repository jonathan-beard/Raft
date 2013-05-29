/**
 * Int16Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "Int16Type.hpp"

using namespace Node;

Int16Type::Int16Type() : IntType(),
                         type_name( "Int16Type" ),
                         max( INT16_MAX ),
                         min( INT16_MIN )
{
   /* nothing to do */
}
