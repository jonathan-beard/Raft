/**
 * Int64Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "Int64Type.hpp"

using namespace Node;

Int64Type::Int64Type() : IntType(
                         "Int64Type" )
{
   class_tree.addRelation( typeid( Node::IntType ).hash_code(),
                           typeid( Node::Int64Type ).hash_code() );
   /* nothing to do here */
}
