/**
 * StreamInput.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 14:40:49 2014
 */
#include "StreamInput.hpp"

using namespace Node;

StreamInput::StreamInput() : StreamEdges( "StreamInput" )
{
   class_tree.addRelation( typeid( Node::StreamEdges ).hash_code(),
                           typeid( Node::StreamInput ).hash_code() );
}


StreamInput::StreamInput( const std::string name ) : StreamEdges( name )
{
   class_tree.addRelation( typeid( Node::StreamEdges ).hash_code(),
                           typeid( Node::StreamInput ).hash_code() );
}
