/**
 * Increment.cpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 10 06:43:37 2014
 */
#include "Increment.hpp"

using namespace Node;

Increment::Increment() : Assignment( "Increment" )
{
   class_tree.addRelation( typeid( Node::Assignment ).hash_code(),
                           typeid( Node::Increment ).hash_code() );
}
