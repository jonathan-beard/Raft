/**
 * Bang.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 12:41:45 2013
 */
#include "Bang.hpp"
using namespace Node;
Bang::Bang() : Returns( "Bang" )
{ 
   class_tree.addRelation( typeid( Node::Returns ).hash_code(),
                           typeid( Node::Bang ).hash_code() );
   /** nothing to do **/
}
