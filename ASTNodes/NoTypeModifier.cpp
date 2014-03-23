/**
 * NoTypeModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 24 09:11:10 2014
 */
#include "NoTypeModifier.hpp"
using namespace Node;

NoTypeModifier::NoTypeModifier() : TypeModifier( "NoTypeModifier" )
{
   class_tree.addRelation( typeid( Node::TypeModifier ).hash_code(),
                           typeid( Node::NoTypeModifier ).hash_code() );
}
