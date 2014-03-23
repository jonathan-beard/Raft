/**
 * ParameterList.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 15:51:14 2014
 */
#include "ParameterList.hpp"
using namespace Node;

ParameterList::ParameterList() : NodeAbstract( "ParameterList" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::ParameterList ).hash_code() );
}

ParameterList::ParameterList( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::ParameterList ).hash_code() );
}
