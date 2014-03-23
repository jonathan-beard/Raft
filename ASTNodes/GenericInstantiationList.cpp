/**
 * GenericInstantiationList.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  2 17:07:26 2014
 */
#include "GenericInstantiationList.hpp"

using namespace Node;

GenericInstantiationList::GenericInstantiationList()
            : NodeAbstract( "GenericInstantiationList" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::GenericInstantiationList ).hash_code() );
}


GenericInstantiationList::GenericInstantiationList( const std::string name )
   : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::GenericInstantiationList ).hash_code() );
}
