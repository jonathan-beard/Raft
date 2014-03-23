/**
 * Abstract.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan 25 06:06:30 2014
 */
#include "Abstract.hpp"

using namespace Node;

Abstract::Abstract() : InstantiationModifier( "Abstract" )
{
   class_tree.addRelation( typeid( Node::InstantiationModifier ).hash_code(),
                           typeid( Node::Abstract ).hash_code() );
}
