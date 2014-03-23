/**
 * Nill.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 14:14:24 2013
 */
#include "Nill.hpp"

using namespace Node;

Nill::Nill() : Returns( "Nill" )
{
   class_tree.addRelation( typeid( Node::Returns ).hash_code(),
                           typeid( Node::Nill ).hash_code() );
   /** nothing to do here **/
}
