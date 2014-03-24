/**
 * LocalVarDecl.cpp - 
 * @author: Jonathan Beard
 * @version: Mon Mar 24 11:56:20 2014
 */
#include "LocalVarDecl.hpp"

using namespace Node;

LocalVarDecl::LocalVarDecl() : VarDeclFollows("LocalVariableDecl")
{
   class_tree.addRelation( typeid( Node::VarDeclFollows ).hash_code(),
                           typeid( Node::LocalVarDecl ).hash_code() );
}
