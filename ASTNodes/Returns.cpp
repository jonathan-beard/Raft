/**
 * Returns.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 13:15:48 2013
 */
#include "Returns.hpp"

using namespace Node;

Returns::Returns() : NodeAbstract( "Returns" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Returns ).hash_code() );
   /** nothing to do here **/
}

Returns::Returns( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Returns ).hash_code() );
   /** nothing to do here **/
}
