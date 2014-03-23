/**
 * MethodInherit.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:17:45 2014
 */
#include "MethodInherit.hpp"

using namespace Node;

MethodInherit::MethodInherit() : Inherit( "MethodInherit" )
{
   class_tree.addRelation( typeid( Node::Inherit ).hash_code(),
                           typeid( Node::MethodInherit ).hash_code() );
}

MethodInherit::MethodInherit( const std::string name ) : Inherit( name )
{
   class_tree.addRelation( typeid( Node::Inherit ).hash_code(),
                           typeid( Node::MethodInherit ).hash_code() );
}
