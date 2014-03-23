/**
 * EmptyBody.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 10:51:37 2014
 */
#include "EmptyBody.hpp"

using namespace Node;

EmptyBody::EmptyBody() : Body( "EmptyBody" )
{
   class_tree.addRelation( typeid( Node::Body ).hash_code(),
                           typeid( Node::EmptyBody ).hash_code() );

}
