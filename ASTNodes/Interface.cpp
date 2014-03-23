/**
 * Interface.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 10:47:23 2014
 */
#include "Interface.hpp"
using namespace Node;

Interface::Interface( const std::string name ) : NodeAbstract( name )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::Interface ).hash_code() );

}
