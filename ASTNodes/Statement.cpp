/**
 * Statement.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb 15 19:49:47 2014
 */
#include "Statement.hpp"

using namespace Node;

Statement::Statement() : NodeAbstract( "Statement" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Statement ).hash_code() );
}

Statement::Statement( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Statement ).hash_code() );
}
