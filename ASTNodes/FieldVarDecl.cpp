/**
 * FieldVarDecl.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan  5 14:39:16 2014
 */
#include "FieldVarDecl.hpp"
using namespace Node;

FieldVarDecl::FieldVarDecl() : VariableDeclaration( "FieldVarDecl" )
{
   class_tree.addRelation( typeid( Node::VariableDeclaration ).hash_code(),
                           typeid( Node::FieldVarDecl ).hash_code() );

}
