/**
 * StreamArgumentList.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 13:17:31 2013
 */
#include "StreamArgumentList.hpp"

using namespace Node;

StreamArgumentList::StreamArgumentList() : ArgumentList( "StreamArgumentList" )
{
   class_tree.addRelation( typeid( Node::ArgumentList ).hash_code(),
                           typeid( Node::StreamArgumentList ).hash_code() );
   /** nothing to do here **/
}
