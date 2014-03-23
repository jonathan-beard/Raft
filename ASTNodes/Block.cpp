/**
 * Block.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 10:45:25 2014
 */
#include "Block.hpp"

using namespace Node;

Block::Block() : NodeAbstract( "Block" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Block ).hash_code() );
}

Block::Block( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Block ).hash_code() );
}
