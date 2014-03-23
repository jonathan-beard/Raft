/**
 * StringType.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "StringType.hpp"

using namespace Node;

StringType::StringType() : Type( "StringType" )
{
   class_tree.addRelation( typeid( Node::Type ).hash_code(),
                           typeid( Node::StringType ).hash_code() );

}

