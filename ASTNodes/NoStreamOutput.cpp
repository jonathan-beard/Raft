/**
 * NoStreamOutput.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 14:40:49 2014
 */
#include "NoStreamOutput.hpp"

using namespace Node;

NoStreamOutput::NoStreamOutput() : StreamOutput( "NoStreamOutput" )
{
   class_tree.addRelation( typeid( Node::StreamOutput ).hash_code(),
                           typeid( Node::NoStreamOutput ).hash_code() );
}
