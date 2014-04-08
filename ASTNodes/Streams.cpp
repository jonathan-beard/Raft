/**
 * Streams.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Apr  8 08:33:58 2014
 */
#include "Streams.hpp"

using namespace Node;

Streams::Streams() : Modifier( "Streams" )
{
   class_tree.addRelation( typeid( Node::Modifier ).hash_code(),
                           typeid( Node::Streams ).hash_code() );
}
   
