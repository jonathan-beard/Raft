/**
 * MethodNoInherit.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:24:19 2014
 */
#include "MethodNoInherit.hpp"

using namespace Node;

MethodNoInherit::MethodNoInherit() : MethodInherit( "MethodNoInherit" )
{
   class_tree.addRelation( typeid( Node::MethodInherit ).hash_code(),
                           typeid( Node::MethodNoInherit ).hash_code() );
}
