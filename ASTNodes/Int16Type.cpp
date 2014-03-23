/**
 * Int16Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "Int16Type.hpp"

using namespace Node;

Int16Type::Int16Type() : IntType(
                         "Int16Type" )
{
   class_tree.addRelation( typeid( Node::IntType ).hash_code(),
                           typeid( Node::Int16Type ).hash_code() );
   /* nothing to do */
}
