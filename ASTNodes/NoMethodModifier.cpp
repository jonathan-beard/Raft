/**
 * NoMethodModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Apr  8 08:31:09 2014
 */
#include "NoMethodModifier.hpp"

using namespace Node;

NoMethodModifier::NoMethodModifier() : Modifier( "NoMethodModifier" )
{
   class_tree.addRelation( typeid( Node::Modifier ).hash_code(),
                           typeid( Node::NoMethodModifier ).hash_code() );
}
