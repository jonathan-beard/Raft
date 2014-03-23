/**
 * Fork.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 12 07:05:04 2014
 */
#include "Fork.hpp"
using namespace Node;

Fork::Fork() : StreamModifier( "Fork" )
{
   class_tree.addRelation( typeid( Node::StreamModifier ).hash_code(),
                           typeid( Node::Fork ).hash_code() );
}
