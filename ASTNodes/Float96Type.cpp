/**
 * Float96Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "Float96Type.hpp"

using namespace Node;

Float96Type::Float96Type() : FloatType(
                             "Float96Type",
                             LDBL_MIN,
                             LDBL_MAX )
{
   class_tree.addRelation( typeid( Node::FloatType ).hash_code(),
                           typeid( Node::Float96Type ).hash_code() );
   /* nothing to do here */
}
