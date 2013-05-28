/**
 * ObjectType.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "ObjectType.hpp"

using namespace Node;

ObjectType::ObjectType()
{
   /* nothing to do here */
}

ObjectType::~ObjectType()
{

}

bool
ObjectType::IsType( std::string *value )
{
   if( value != nullptr ) return( true );
   return( false );
}
