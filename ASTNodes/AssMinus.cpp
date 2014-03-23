/**
 * AssMinus.cpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 10 08:27:56 2014
 */
#include "AssMinus.hpp"

using namespace Node;

AssMinus::AssMinus() : Assignment( "AssMinus" )
{
   class_tree.addRelation( typeid( Node::Assignment ).hash_code(),
                           typeid( Node::AssMinus ).hash_code() );
}
