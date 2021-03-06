/**
 * VectorType.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 15:24:30 2013
 */
#include "VectorType.hpp"

using namespace Node;

VectorType::VectorType( size_t s )
   :  TypeModifier( "VectorType" ),
      size( s )
{
   class_tree.addRelation( typeid( Node::TypeModifier ).hash_code(),
                           typeid( Node::VectorType ).hash_code() );
   /* nothing to do here */
}

VectorType::VectorType( const std::string n,
                        size_t s ) : TypeModifier( n ),
                                     size( s )
{
   class_tree.addRelation( typeid( Node::TypeModifier ).hash_code(),
                           typeid( Node::VectorType ).hash_code() );
   /* nothing to do here */
}

VectorType::~VectorType(){
   /* nothing to destroy */  
}

size_t
VectorType::get_size()
{
   return( size );
}
