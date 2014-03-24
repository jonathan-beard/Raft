/**
 * VarDeclFollows.cpp - 
 * @author: Jonathan Beard
 * @version: Mon Mar 24 12:02:28 2014
 */
#include "VarDeclFollows.hpp"

using namespace Node;

VarDeclFollows::VarDeclFollows() : Follows( "VarDeclFollows" )
{
   class_tree.addRelation( typeid( Node::Follows ).hash_code(),
                           typeid( Node::VarDeclFollows ).hash_code() );
}

VarDeclFollows::VarDeclFollows(const std::string name ) : 
                                          Follows( name )
{
   class_tree.addRelation( typeid( Node::Follows ).hash_code(),
                           typeid( Node::VarDeclFollows ).hash_code() );
}
