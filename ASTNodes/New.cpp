/**
 * New.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 12:59:03 2013
 */
#include "New.hpp"
using namespace Node;

New::New() : Returns( "New" )
{
   class_tree.addRelation( typeid( Node::Returns ).hash_code(),
                           typeid( Node::New ).hash_code() );

}
