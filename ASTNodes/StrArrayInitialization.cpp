/**
 * StrArrayInitialization.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Feb 13 09:01:07 2014
 */
#include "StrArrayInitialization.hpp"
using namespace Node;

StrArrayInitialization::StrArrayInitialization()
   : ArrayInitialization( "StrArrayInitialization" )
{
   class_tree.addRelation( typeid( Node::ArrayInitialization ).hash_code(),
                           typeid( Node::StrArrayInitialization ).hash_code() );

}
