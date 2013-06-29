/**
 * ObjectType.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include <cassert>
#include "Initializer.hpp"
#include "ObjectType.hpp"

using namespace Node;

ObjectType::ObjectType() : Type( "ObjectType" )
{
   /* nothing to do here */
}

ObjectType::~ObjectType()
{

}

bool
ObjectType::IsType( std::string *value )
{
   
   if( value != nullptr ){
      name = *value;
      return( true );
   }
   return( false );
}

Initializer*
ObjectType::GetDefaultInitializer()
{
   assert( false );
   return( new Initializer() );
}
