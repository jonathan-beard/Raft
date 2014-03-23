/**
 * Static.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Jan  7 12:52:01 2014
 */
#include "Static.hpp"

using namespace Node;

Static::Static() : StorageModifier( "Static" )
{
   class_tree.addRelation( typeid( Node::StorageModifier ).hash_code(),
                           typeid( Node::Static ).hash_code() );

}
