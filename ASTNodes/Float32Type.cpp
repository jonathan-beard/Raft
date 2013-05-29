/**
 * Float32Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "Float32Type.hpp"

using namespace Node;

Float32Type::Float32Type() : FloatType(),
                             type_name( "Float32Type" ),
                             min( FLT_MIN ),
                             max( FLT_MAX )
{

}
