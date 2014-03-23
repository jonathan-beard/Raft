/**
 * WhileStatement.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb 15 09:23:35 2014
 */
#include "WhileStatement.hpp"

using namespace Node;

WhileStatement::WhileStatement() : Statement( "WhileStatement" )
{
   class_tree.addRelation( typeid( Node::Statement ).hash_code(),
                           typeid( Node::WhileStatement ).hash_code() );
}
