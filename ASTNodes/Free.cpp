/**
 * Free.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Feb 12 08:27:34 2014
 */
#include "Free.hpp"

using namespace Node;

Free::Free() : NodeAbstract( "Free" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Free ).hash_code() );
}
