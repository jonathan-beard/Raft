/**
 * ObjectType.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include <cassert>
#include "Initializer.hpp"
#include "ObjectType.hpp"

using namespace Node;

ObjectType::ObjectType( std::string name) : Type( name )
{
   /* nothing to do here */
}

ObjectType::~ObjectType()
{

}

bool
ObjectType::IsType( std::string value )
{
   /** not much we can do about this here,
    *  wait for verification once the entry
    *  of the object type is in the symbol
    *  table 
    */
   return( true );
}

Initializer*
ObjectType::GetDefaultInitializer()
{
   /* there's not really a better solution than this,
    * just hope that the user really does define a decent
    * initializer routine for their built objects, remember
    * that all the primitives will at least be initialized
    * properly
    */
   return( nullptr );
}
