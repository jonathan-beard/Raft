/**
 * Super.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 14:14:24 2013
 */
#include "Super.hpp"

using namespace Node;

Super::Super() : Returns( "Super" )
{
   class_tree.addRelation( typeid( Node::Returns ).hash_code(),
                           typeid( Node::Super ).hash_code() );
   /** nothing to do here **/
}
