/**
 * This.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 14:14:25 2013
 */
#include "This.hpp"

using namespace Node;

This::This() : Returns( "This" )
{
   class_tree.addRelation( typeid( Node::Returns ).hash_code(),
                           typeid( Node::This ).hash_code() );
   /** nothing to do here **/
}
