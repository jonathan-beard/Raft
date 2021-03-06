/**
 * ClassExtends.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:24:19 2014
 */
#include "ClassExtends.hpp"

using namespace Node;

ClassExtends::ClassExtends() : ClassInherit( "ClassExtends" )
{
   class_tree.addRelation( typeid( Node::ClassInherit ).hash_code(),
                           typeid( Node::ClassExtends ).hash_code() );
}
