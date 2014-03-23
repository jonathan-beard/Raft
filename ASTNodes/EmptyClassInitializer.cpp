/**
 * EmptyClassInitializer.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 10 15:48:25 2014
 */
#include "EmptyClassInitializer.hpp"

using namespace Node;

EmptyClassInitializer::EmptyClassInitializer() : 
                                   ClassInitializer( "EmptyClassInitializer" )
{
   class_tree.addRelation( typeid( Node::ClassInitializer ).hash_code(),
                           typeid( Node::EmptyClassInitializer ).hash_code() );
}
