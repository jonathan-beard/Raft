/**
 * StringType.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "StringType.hpp"
#include "Initializer.hpp"

using namespace Node;

StringType::StringType() : Type(),
                           type_name( "StringType" )
{

}

StringType::~StringType()
{

}

bool
StringType::IsType( std::string *value )
{
   if( value != nullptr ) return( true );
   return( false );
}


Initializer*
StringType::GetDefaultInitializer()
{
   return( new Initializer( (std::string) ""  ));
}
