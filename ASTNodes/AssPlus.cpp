/**
 * AssPlus.cpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 10 08:27:56 2014
 */
#include "AssPlus.hpp"

using namespace Node;

AssPlus::AssPlus() : Assignment( "AssPlus" )
{
   class_tree.addRelation( typeid( Node::Assignment ).hash_code(),
                           typeid( Node::AssPlus ).hash_code() );
}
