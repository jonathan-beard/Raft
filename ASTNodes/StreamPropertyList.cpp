/**
 * StreamPropertyList.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 09:41:19 2013
 */
#include "StreamPropertyList.hpp"

using namespace Node;

StreamPropertyList::StreamPropertyList() : 
                              NodeAbstract( "StreamPropertyList" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::StreamPropertyList ).hash_code() );
   /** nothing to do here **/
}
