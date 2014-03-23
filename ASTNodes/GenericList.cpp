/**
 * GenericList.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan  2 15:29:28 2014
 */
#include "GenericList.hpp"

using namespace Node;

GenericList::GenericList() : NodeAbstract( "GenericList" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::GenericList ).hash_code() );

}
