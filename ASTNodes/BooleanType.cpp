/**
 * BooleanType.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include <cassert>
#include "BooleanType.hpp"

using namespace Node;

BooleanType::BooleanType() : Type("BooleanType")
{
   class_tree.addRelation( typeid( Node::Type ).hash_code(),
                           typeid( Node::BooleanType ).hash_code() );
   /* nothing to do here */
}

