/**
 * NoArgumentList.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 24 09:40:46 2014
 */
#include "NoArgumentList.hpp"

using namespace Node;

NoArgumentList::NoArgumentList() : ArgumentList( "NoArgumentList" )
{
   class_tree.addRelation( typeid( Node::ArgumentList ).hash_code(),
                           typeid( Node::NoArgumentList ).hash_code() );
}
