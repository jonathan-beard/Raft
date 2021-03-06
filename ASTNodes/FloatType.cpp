/**
 * FloatType.cpp - 
 * @author: Jonathan Beard
 * @version: Tue May 28 08:22:55 2013
 */

#include "FloatType.hpp"

using namespace Node;

FloatType::FloatType() : Type( "GenericFloat" ),
                         min( LDBL_MIN ),
                         max( LDBL_MAX )
{
   class_tree.addRelation( typeid( Node::Type ).hash_code(),
                           typeid( Node::FloatType ).hash_code() );
   /* nothing really to do here */
}

FloatType::FloatType( const std::string n,
                      long double minimum,
                      long double maximum ) :
                        Type( n ),
                        min( minimum ),
                        max( maximum )
{
   class_tree.addRelation( typeid( Node::Type ).hash_code(),
                           typeid( Node::FloatType ).hash_code() );
   /* nothing really to do here */
}

FloatType::~FloatType()
{

}

bool
FloatType::IsType( long double value )
{
   if( value <= max && value >= min ) return( true );
   return( false );
}
