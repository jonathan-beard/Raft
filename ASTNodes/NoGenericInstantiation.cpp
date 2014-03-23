/**
 * NoGenericInstantiation.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  2 17:07:26 2014
 */
#include "NoGenericInstantiation.hpp"

using namespace Node;

NoGenericInstantiation::NoGenericInstantiation() : 
            GenericInstantiationList( "NoGenericInstantiation" )
{
   class_tree.addRelation( typeid( Node::GenericInstantiationList ).hash_code(),
                           typeid( Node::NoGenericInstantiation ).hash_code() );
}
