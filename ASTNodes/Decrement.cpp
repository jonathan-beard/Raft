/**
 * Decrement.cpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 10 06:43:37 2014
 */
#include "Decrement.hpp"

using namespace Node;

Decrement::Decrement() : Assignment( "Decrement" )
{
   class_tree.addRelation( typeid( Node::Assignment ).hash_code(),
                           typeid( Node::Decrement ).hash_code() );
}
