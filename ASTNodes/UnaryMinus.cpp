/**
 * UnaryMinus.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 13:40:03 2013
 */
#include "UnaryMinus.hpp"

using namespace Node;

UnaryMinus::UnaryMinus() : Returns( "UnaryMinus" )
{
   class_tree.addRelation( typeid( Node::Returns ).hash_code(),
                           typeid( Node::UnaryMinus ).hash_code() );
   /** nothing to do here **/
}
