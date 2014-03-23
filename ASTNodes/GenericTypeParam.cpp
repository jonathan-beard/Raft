/**
 * GenericTypeParam.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan  2 15:35:18 2014
 */
#include "GenericTypeParam.hpp"

using namespace Node;

GenericTypeParam::GenericTypeParam( const std::string name ) : Generic( name )
{
   class_tree.addRelation( typeid( Node::Generic ).hash_code(),
                           typeid( Node::GenericTypeParam ).hash_code() );

}
