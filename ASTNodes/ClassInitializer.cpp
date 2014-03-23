/**
 * ClassInitializer.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 10 15:48:25 2014
 */
#include "ClassInitializer.hpp"

using namespace Node;

ClassInitializer::ClassInitializer( const std::string name ) : Initializer( name )
{
   class_tree.addRelation( typeid( Node::Initializer ).hash_code(),
                           typeid( Node::ClassInitializer ).hash_code() );

}
