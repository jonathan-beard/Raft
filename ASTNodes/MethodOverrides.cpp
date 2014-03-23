/**
 * MethodOverrides.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:24:19 2014
 */
#include "MethodOverrides.hpp"

using namespace Node;

MethodOverrides::MethodOverrides() : MethodInherit( "MethodOverrides" )
{
   class_tree.addRelation( typeid( Node::MethodInherit ).hash_code(),
                           typeid( Node::MethodOverrides ).hash_code() );
}
