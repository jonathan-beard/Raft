/**
 * StringType.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "StringType.hpp"
#include "Initializer.hpp"

using namespace Node;

StringType::StringType() : Type( "StringType" )
{

}

StringType::~StringType()
{

}

bool
StringType::IsType( std::string value )
{
   return( true );
}


Initializer*
StringType::GetDefaultInitializer()
{
   return( new Initializer( (std::string) ""  ));
}
