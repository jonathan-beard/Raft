/**
 * NumArrayInitialization.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Feb 13 09:01:07 2014
 */
#include "NumArrayInitialization.hpp"

using namespace Node;

NumArrayInitialization::NumArrayInitialization() : 
   ArrayInitialization( "NumArrayInitialization" )
{
   class_tree.addRelation( typeid( Node::ArrayInitialization ).hash_code(),
                           typeid( Node::NumArrayInitialization ).hash_code() );
}
