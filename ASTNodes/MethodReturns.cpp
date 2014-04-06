/**
 * MethodReturns.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Apr  3 09:49:31 2014
 */
#include "MethodReturns.hpp"

using namespace Node;

MethodReturns::MethodReturns() : NodeAbstract( "MethodReturns" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::MethodReturns ).hash_code() );
}
