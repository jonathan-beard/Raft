/**
 * NoParameter.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Jan 21 10:23:21 2014
 */
#include "NoParameter.hpp"

using namespace Node;

NoParameter::NoParameter() : Parameter( "NoParameter" )
{
   class_tree.addRelation( typeid( Node::Parameter ).hash_code(),
                           typeid( Node::NoParameter ).hash_code() );
}
