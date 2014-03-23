/**
 * Float64Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "Float64Type.hpp"

using namespace Node;

Float64Type::Float64Type() : FloatType(
                             "Float64Type", 
                             DBL_MIN, 
                             DBL_MAX )
{
   class_tree.addRelation( typeid( Node::FloatType ).hash_code(),
                           typeid( Node::Float64Type ).hash_code() );
   /* nothing to do here */
}
