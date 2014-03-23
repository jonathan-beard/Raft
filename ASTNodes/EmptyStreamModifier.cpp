/**
 * EmptyStreamModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 12 07:07:50 2014
 */
#include "EmptyStreamModifier.hpp"
using namespace Node;
EmptyStreamModifier::EmptyStreamModifier() : 
                                    StreamModifier( "EmptyStreamModifier" )
{
   class_tree.addRelation( typeid( Node::StreamModifier ).hash_code(),
                           typeid( Node::EmptyStreamModifier ).hash_code() );
}
