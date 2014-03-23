/**
 * Referencing.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 13:00:46 2013
 */
#include "Referencing.hpp"

using namespace Node;

Referencing::Referencing() : NodeAbstract( "Referencing" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Referencing ).hash_code() );
   /** nothing to do here **/
}

Referencing::Referencing( const std::string name ) :
                                    NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Referencing ).hash_code() );
   /** nothing to do here **/
}
