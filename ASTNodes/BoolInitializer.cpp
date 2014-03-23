/**
 * BoolInitializer.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Sep 28 19:46:20 2013
 */
#include "BoolInitializer.hpp"

using namespace Node;

BoolInitializer::BoolInitializer( bool v, const std::string name ) : Initializer( v, name )
{
   class_tree.addRelation( typeid( Node::Initializer ).hash_code(),
                           typeid( Node::BoolInitializer ).hash_code() );

}
