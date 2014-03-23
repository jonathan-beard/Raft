/**
 * DelayedName.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 14:39:10 2013
 */
#include "DelayedName.hpp"

using namespace Node;

DelayedName::DelayedName() : Returns( "DelayedName" )
{
   class_tree.addRelation( typeid( Node::Returns ).hash_code(),
                           typeid( Node::DelayedName ).hash_code() );
   /** nothing to do here **/
}
