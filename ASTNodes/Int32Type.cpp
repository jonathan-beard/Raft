/**
 * Int32Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "Int32Type.hpp"

using namespace Node;

Int32Type::Int32Type() : IntType(
                         "Int32Type" )
{
   class_tree.addRelation( typeid( Node::IntType ).hash_code(),
                           typeid( Node::Int32Type ).hash_code() );
   /* nothing to do here */
}
