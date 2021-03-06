/**
 * VariableDeclaration.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan 23 13:56:33 2014
 */
#include "VariableDeclaration.hpp"

using namespace Node;

VariableDeclaration::VariableDeclaration( const std::string name ) : 
                                                             Declaration( name )
{
   class_tree.addRelation( typeid( Node::Declaration ).hash_code(),
                           typeid( Node::VariableDeclaration ).hash_code() );
}
