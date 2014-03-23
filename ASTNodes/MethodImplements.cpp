/**
 * MethodImplements.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:24:19 2014
 */
#include "MethodImplements.hpp"

using namespace Node;

MethodImplements::MethodImplements() : MethodInherit( "MethodImplements" )
{
   class_tree.addRelation( typeid( Node::MethodInherit ).hash_code(),
                           typeid( Node::MethodImplements ).hash_code() );
}
