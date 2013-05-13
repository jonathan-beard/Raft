/**
 * Type.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#include "Type.hpp"

Type::Type() : name( "AbstractType" )
{
   /* nothing to do */
}

Type::Type( const Type &type )
{
   this->name = type.name;
}

Type::~Type()
{
   /* nothing to destroy :( */
}

std::string Type::print( std::ostream &stream )
{
   stream << name;
}

