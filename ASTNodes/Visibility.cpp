/**
 * Visibility.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 14:06:39 2014
 */
#include "Visibility.hpp"

using namespace Node;

Visibility::Visibility( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Visibility ).hash_code() );

}
