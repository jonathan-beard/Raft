/**
 * ArrayParameter.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan 23 12:01:22 2014
 */
#include "ArrayParameter.hpp"
using namespace Node;

ArrayParameter::ArrayParameter() : Parameter( "ArrayParameter" )
{
   class_tree.addRelation( typeid( Node::Parameter ).hash_code(),
                           typeid( Node::ArrayParameter ).hash_code() );
}
