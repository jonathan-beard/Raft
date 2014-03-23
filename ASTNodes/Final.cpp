/**
 * Final.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan 25 06:06:30 2014
 */
#include "Final.hpp"

using namespace Node;

Final::Final() : InstantiationModifier( "Final" )
{
   class_tree.addRelation( typeid( Node::InstantiationModifier ).hash_code(),
                           typeid( Node::Final ).hash_code() );
}
