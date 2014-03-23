/**
 * NoSizeParameter.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  2 15:46:03 2014
 */
#include "NoSizeParameter.hpp"

using namespace Node;

NoSizeParameter::NoSizeParameter() : Parameter( "NoSizeParameter" )
{
   class_tree.addRelation( typeid( Node::Parameter ).hash_code(),
                           typeid( Node::NoSizeParameter ).hash_code() );
}
