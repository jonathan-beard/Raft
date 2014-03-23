/**
 * Equals.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb  8 17:29:36 2014
 */
#include "Equals.hpp"

using namespace Node;

Equals::Equals() : Assignment( "Equals" )
{
   class_tree.addRelation( typeid( Node::Assignment ).hash_code(),
                           typeid( Node::Equals ).hash_code() );
}
