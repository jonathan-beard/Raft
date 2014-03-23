/**
 * Float32Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */

#include "Float32Type.hpp"

using namespace Node;

Float32Type::Float32Type() : FloatType("Float32Type", 
                                       FLT_MIN,
                                       FLT_MAX )
{
   class_tree.addRelation( typeid( Node::FloatType ).hash_code(),
                           typeid( Node::Float32Type ).hash_code() );
 /* nothing really to do here */
}

