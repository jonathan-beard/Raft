/**
 * Source.cpp - 
 * @author: Jonathan Beard
 * @version: Mon Jul 22 14:30:50 2013
 */
#include "Source.hpp"

using namespace Node;

Source::Source() : NodeAbstract("Source")
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Source ).hash_code() );
}
