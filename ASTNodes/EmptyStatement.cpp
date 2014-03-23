/**
 * EmptyStatement.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Feb 14 21:11:48 2014
 */
#include "EmptyStatement.hpp"

using namespace Node;

EmptyStatement::EmptyStatement() : Statement( "EmptyStatement" ){

   class_tree.addRelation( typeid( Node::Statement ).hash_code(),
                           typeid( Node::EmptyStatement ).hash_code() );
}
