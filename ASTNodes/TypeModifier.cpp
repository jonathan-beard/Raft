/**
 * TypeModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 15:51:44 2013
 */
#include "TypeModifier.hpp"

using namespace Node;

TypeModifier::TypeModifier() : NodeAbstract( "TypeModifier" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::TypeModifier ).hash_code() );
   /* nothing to do here */
}

TypeModifier::TypeModifier( const std::string n ) :
                               NodeAbstract( n )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::TypeModifier ).hash_code() );
   /* nothing to do here */
}

TypeModifier::~TypeModifier()
{ 
   /* nothing do destroy */
}
