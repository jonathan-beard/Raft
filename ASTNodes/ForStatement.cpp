/**
 * ForStatement.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb 15 09:23:35 2014
 */
#include "ForStatement.hpp"

using namespace Node;

ForStatement::ForStatement() : Statement( "ForStatement" )
{
   class_tree.addRelation( typeid( Node::Statement ).hash_code(),
                           typeid( Node::ForStatement ).hash_code() );
}
