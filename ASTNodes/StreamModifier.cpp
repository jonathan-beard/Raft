/**
 * StreamModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 12 06:44:01 2014
 */
#include "StreamModifier.hpp"

using namespace Node;

StreamModifier::StreamModifier() : Modifier( "StreamModifier" )
{
   class_tree.addRelation( typeid( Node::Modifier ).hash_code(),
                           typeid( Node::StreamModifier ).hash_code() );
}


StreamModifier::StreamModifier( const std::string name ) : Modifier( name )
{
   class_tree.addRelation( typeid( Node::Modifier ).hash_code(),
                           typeid( Node::StreamModifier ).hash_code() );
}
