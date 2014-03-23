/**
 * Protected.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 14:06:39 2014
 */
#include "Protected.hpp"

using namespace Node;

Protected::Protected() : Visibility( "Protected" )
{
   class_tree.addRelation( typeid( Node::Visibility ).hash_code(),
                           typeid( Node::Protected ).hash_code() );

}
