/**
 * GenericClassParam.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan  2 15:35:18 2014
 */
#include "GenericClassParam.hpp"

using namespace Node;

GenericClassParam::GenericClassParam( const std::string name ) : Generic( name )
{
   class_tree.addRelation( typeid( Node::Generic ).hash_code(),
                           typeid( Node::GenericClassParam ).hash_code() );

}
