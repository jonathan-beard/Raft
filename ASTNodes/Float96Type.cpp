/**
 * Float96Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "Float96Type.hpp"

using namespace Node;

Float96Type::Float96Type() : FloatType(),
                             type_name( "Float96Type" ),
                             min( LDBL_MIN ),
                             max( LDBL_MAX )
{
   /* nothing to do here */
}
