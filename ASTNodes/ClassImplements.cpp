/**
 * ClassImplements.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:24:19 2014
 */
#include "ClassImplements.hpp"

using namespace Node;

ClassImplements::ClassImplements() : ClassInherit( "ClassImplements" )
{
   class_tree.addRelation( typeid( Node::ClassInherit ).hash_code(),
                           typeid( Node::ClassImplements ).hash_code() );
}
