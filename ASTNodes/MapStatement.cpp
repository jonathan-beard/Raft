/**
 * MapStatement.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb 15 09:23:35 2014
 */
#include "MapStatement.hpp"

using namespace Node;

MapStatement::MapStatement() : Statement( "MapStatement" )
{
   class_tree.addRelation( typeid( Node::Statement ).hash_code(),
                           typeid( Node::MapStatement ).hash_code() );
}
