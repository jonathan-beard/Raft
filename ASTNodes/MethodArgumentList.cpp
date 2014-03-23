/**
 * MethodArgumentList.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 13:17:31 2013
 */
#include "MethodArgumentList.hpp"

using namespace Node;

MethodArgumentList::MethodArgumentList() : ArgumentList( "MethodArgumentList" )
{
   class_tree.addRelation( typeid( Node::ArgumentList ).hash_code(),
                           typeid( Node::MethodArgumentList ).hash_code() );
   /** nothing to do here **/
}
