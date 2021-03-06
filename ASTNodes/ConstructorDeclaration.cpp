/**
 * ConstructorDeclaration.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 10 15:43:30 2014
 */
#include "ConstructorDeclaration.hpp"

using namespace Node;

ConstructorDeclaration::ConstructorDeclaration() : Declaration( "ConstructorDeclaration" )
{
   class_tree.addRelation( typeid( Node::Declaration ).hash_code(),
                           typeid( Node::ConstructorDeclaration ).hash_code() );
}
