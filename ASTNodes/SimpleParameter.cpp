/**
 * SimpleParameter.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan 23 12:01:22 2014
 */
#include "SimpleParameter.hpp"

using namespace Node;

SimpleParameter::SimpleParameter() : Parameter( "SimpleParameter" )
{
   class_tree.addRelation( typeid( Node::Parameter ).hash_code(),
                           typeid( Node::SimpleParameter ).hash_code() );
}
