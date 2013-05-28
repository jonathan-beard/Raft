/**
 * Int8Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include <cstdint>
#include "Int8Type.hpp"

Int8Type::Int8Type() : IntType(),
                       max( INT8_MAX ),
                       min( INT8_MIN )
{
   /* nothing to do */
}
