/**
 * ArgumentList.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 13:17:31 2013
 */
#include "ArgumentList.hpp"

using namespace Node;

ArgumentList::ArgumentList() : NodeAbstract( "ArgumentList" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::ArgumentList ).hash_code() );
   /** nothing to do here **/
}

ArgumentList::ArgumentList( const std::string name ) : 
                              NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::ArgumentList ).hash_code() );
   /** nothing to do here **/
}
