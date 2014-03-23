/**
 * StreamOutput.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 14:40:49 2014
 */
#include "StreamOutput.hpp"

using namespace Node;

StreamOutput::StreamOutput() : StreamEdges( "StreamOutput" )
{
   class_tree.addRelation( typeid( Node::StreamEdges ).hash_code(),
                           typeid( Node::StreamOutput ).hash_code() );
}


StreamOutput::StreamOutput( const std::string name ) : StreamEdges( name )
{
   class_tree.addRelation( typeid( Node::StreamEdges ).hash_code(),
                           typeid( Node::StreamOutput ).hash_code() );
}
