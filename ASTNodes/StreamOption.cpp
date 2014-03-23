/**
 * StreamOption.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 16:34:15 2013
 */
#include "StreamOption.hpp"

using namespace Node;

StreamOption::StreamOption() : NodeAbstract( "StreamOption" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::StreamOption ).hash_code() );
   /** nothing to do here **/
}
