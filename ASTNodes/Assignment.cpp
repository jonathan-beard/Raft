/**
 * Assignment.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb  8 17:29:36 2014
 */
#include "Assignment.hpp"
using namespace Node;

Assignment::Assignment() : NodeAbstract( "Assignment" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Assignment ).hash_code() );
}

Assignment::Assignment( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Assignment ).hash_code() );
}
