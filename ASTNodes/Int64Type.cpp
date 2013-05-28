/**
 * Int64Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "Int64Type.hpp"

using namespace Node;

Int64Type::Int64Type() : IntType(),
                         max( INT64_MAX ),
                         min( INT64_MIN )
{
   /* nothing to do here */
}
