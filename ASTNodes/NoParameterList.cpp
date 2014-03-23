/**
 * NoParameterList.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 15:51:14 2014
 */
#include "NoParameterList.hpp"

using namespace Node;

NoParameterList::NoParameterList() : ParameterList( "NoParameterList" )
{
   class_tree.addRelation( typeid( Node::ParameterList ).hash_code(),
                           typeid( Node::NoParameterList ).hash_code() );
}
