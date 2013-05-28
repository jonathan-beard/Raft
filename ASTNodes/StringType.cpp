/**
 * StringType.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#include "StringType.hpp"

using namespace Node;

StringType::StringType() : Type()
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
