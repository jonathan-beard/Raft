/**
 * StreamReferencing.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 13:00:46 2013
 */
#include "StreamReferencing.hpp"
using namespace Node;

StreamReferencing::StreamReferencing() : 
                                       Referencing( "StreamReferencing" )
{
   class_tree.addRelation( typeid( Node::Referencing ).hash_code(),
                           typeid( Node::StreamReferencing ).hash_code() );
   /** nothing to do here **/
}
