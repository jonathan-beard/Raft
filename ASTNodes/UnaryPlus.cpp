/**
 * UnaryPlus.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 13:40:03 2013
 */
#include "UnaryPlus.hpp"

using namespace Node;

UnaryPlus::UnaryPlus() : Returns( "UnaryPlus" )
{
   class_tree.addRelation( typeid( Node::Returns ).hash_code(),
                           typeid( Node::UnaryPlus ).hash_code() );
   /** nothing to do here **/
}
