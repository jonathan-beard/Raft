/**
 * Tilde.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 12:41:45 2013
 */
#include "Tilde.hpp"
using namespace Node;

Tilde::Tilde() : Returns( "Tilde" )
{
   class_tree.addRelation( typeid( Node::Returns ).hash_code(),
                           typeid( Node::Tilde ).hash_code() );
   /** nothing to do **/
}
