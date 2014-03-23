/**
 * Public.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 14:06:39 2014
 */
#include "Public.hpp"
using namespace Node;
Public::Public() : Visibility( "Public" )
{
   class_tree.addRelation( typeid( Node::Visibility ).hash_code(),
                           typeid( Node::Public ).hash_code() );

}
