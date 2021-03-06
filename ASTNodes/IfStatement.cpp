/**
 * IfStatement.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb 15 09:23:35 2014
 */
#include "IfStatement.hpp"

using namespace Node;

IfStatement::IfStatement() : Statement( "IfStatement" )
{
   class_tree.addRelation( typeid( Node::Statement ).hash_code(),
                           typeid( Node::IfStatement ).hash_code() );
}
