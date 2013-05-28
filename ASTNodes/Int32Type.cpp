/**
 * Int32Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "Int32Type.hpp"

using namespace Node;

Int32Type::Int32Type() : IntType(),
                         max( INT32_MAX ),
                         min( INT32_MIN )
{
   /* nothing to do here */
}
