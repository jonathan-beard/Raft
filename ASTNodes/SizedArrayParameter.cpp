/**
 * SizedArrayParameter.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan 23 12:01:22 2014
 */
#include "SizedArrayParameter.hpp"
using namespace Node;

SizedArrayParameter::SizedArrayParameter() : Parameter( "SizedArrayParameter" )
{
   class_tree.addRelation( typeid( Node::Parameter ).hash_code(),
                           typeid( Node::SizedArrayParameter ).hash_code() );
}
