/**
 * BoolArrayInitialization.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Feb 13 09:01:07 2014
 */
#include "BoolArrayInitialization.hpp"

using namespace Node;

BoolArrayInitialization::BoolArrayInitialization() :
   ArrayInitialization( "BoolArrayInitialization" )
{
   class_tree.addRelation( typeid( Node::ArrayInitialization ).hash_code(),
                           typeid( Node::BoolArrayInitialization ).hash_code() );
}
