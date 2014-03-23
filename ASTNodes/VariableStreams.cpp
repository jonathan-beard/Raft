/**
 * VariableStreams.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 09:41:19 2013
 */
#include "VariableStreams.hpp"

using namespace Node;

VariableStreams::VariableStreams() : NodeAbstract( "VariableStreams" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::VariableStreams ).hash_code() );
   /** nothing to do here **/
}
