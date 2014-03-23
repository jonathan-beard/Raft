/**
 * ClassNoInherit.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:24:19 2014
 */
#include "ClassNoInherit.hpp"

using namespace Node;

ClassNoInherit::ClassNoInherit() : ClassInherit( "ClassNoInherit" )
{
   class_tree.addRelation( typeid( Node::ClassInherit ).hash_code(),
                           typeid( Node::ClassNoInherit ).hash_code() );
}
