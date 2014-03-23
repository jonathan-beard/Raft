/**
 * StreamEdges.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 14:34:56 2014
 */
#include "StreamEdges.hpp"

using namespace Node;

StreamEdges::StreamEdges() : NodeAbstract( "StreamEdges" ) 
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::StreamEdges ).hash_code() );
}

StreamEdges::StreamEdges( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::StreamEdges ).hash_code() );
}

