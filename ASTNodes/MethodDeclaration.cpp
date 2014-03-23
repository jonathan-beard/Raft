/**
 * MethodDeclaration.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 15 10:56:35 2014
 */
#include "MethodDeclaration.hpp"

using namespace Node;

MethodDeclaration::MethodDeclaration( const std::string name ) : Declaration( name )
{
   class_tree.addRelation( typeid( Node::Declaration ).hash_code(),
                           typeid( Node::MethodDeclaration ).hash_code() );

}
