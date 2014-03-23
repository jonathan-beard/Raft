/**
 * Parameter.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan  5 13:05:30 2014
 */
#include "Parameter.hpp"

using namespace Node;

Parameter::Parameter() : NodeAbstract( "Parameter" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Parameter ).hash_code() );

}

Parameter::Parameter( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Parameter ).hash_code() );

}
