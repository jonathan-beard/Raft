/**
 * Converge.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 12 07:05:04 2014
 */
#include "Converge.hpp"

using namespace Node;

Converge::Converge() : StreamModifier( "Converge" )
{
   class_tree.addRelation( typeid( Node::StreamModifier ).hash_code(),
                           typeid( Node::Converge ).hash_code() );
}
