/**
 * Allocation.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 12:55:09 2013
 */
#include "Allocation.hpp"
using namespace Node;

Allocation::Allocation() : Returns( "Allocation" )
{
   class_tree.addRelation( typeid( Node::Returns ).hash_code(),
                           typeid( Node::Allocation ).hash_code() );
}
