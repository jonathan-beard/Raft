/**
 * NoInstantiationModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan 25 06:06:30 2014
 */
#include "NoInstantiationModifier.hpp"

using namespace Node;

NoInstantiationModifier::NoInstantiationModifier() :
                      InstantiationModifier( "NoInstantiationModifier" )
{
   class_tree.addRelation( typeid( Node::InstantiationModifier ).hash_code(),
                           typeid( Node::NoInstantiationModifier ).hash_code() );
}
