/**
 * GenericInstantiation.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  9 14:22:46 2014
 */
#include "GenericInstantiation.hpp"

using namespace Node;

GenericInstantiation::GenericInstantiation() : Declaration( "GenericInstantiation" )
{
   class_tree.addRelation( typeid( Node::Declaration ).hash_code(),
                           typeid( Node::GenericInstantiation ).hash_code() );
}
