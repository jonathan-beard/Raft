/**
 * EmptyTypeModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 17 14:36:37 2014
 */
#include "EmptyTypeModifier.hpp"

using namespace Node;

EmptyTypeModifier::EmptyTypeModifier() : TypeModifier( "EmptyTypeModifier" )
{
   class_tree.addRelation( typeid( Node::TypeModifier ).hash_code(),
                           typeid( Node::EmptyTypeModifier ).hash_code() );
}
