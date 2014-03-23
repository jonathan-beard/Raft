/**
 * GenericTypeMultiple.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan  2 15:49:24 2014
 */
#include "GenericTypeMultiple.hpp"

using namespace Node;

GenericTypeMultiple::GenericTypeMultiple() : Generic( "GenericTypeMultiple" )
{
   class_tree.addRelation( typeid( Node::Generic ).hash_code(),
                           typeid( Node::GenericTypeMultiple ).hash_code() );

}
