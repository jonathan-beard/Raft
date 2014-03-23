/**
 * NoStreamInput.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 14:40:49 2014
 */
#include "NoStreamInput.hpp"

using namespace Node;

NoStreamInput::NoStreamInput() : StreamInput( "NoStreamInput" )
{
   class_tree.addRelation( typeid( Node::StreamInput ).hash_code(),
                           typeid( Node::NoStreamInput ).hash_code() );
}
