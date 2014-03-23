/**
 * Int8Type.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include <cstdint>
#include "Int8Type.hpp"

using namespace Node;

Int8Type::Int8Type() : IntType( 
                        "Int8Type")
{
   class_tree.addRelation( typeid( Node::IntType ).hash_code(),
                           typeid( Node::Int8Type ).hash_code() );
   /* nothing to do */
}
