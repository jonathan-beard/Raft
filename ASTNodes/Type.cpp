/**
 * Type.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#include "Type.hpp"

using namespace Node;

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

bool
Type::IsType( uintmax_t value )
{
   return( false );
}

bool
Type::IsType( long double value )
{
   return( false );
}

bool
Type::IsType( std::string *value )
{
   return( false );
}

void
Type::set_type( const Type &type )
{
   (this)->name = type.name;
}

std::ostream&
Type::print( std::ostream &stream )
{
   stream << name;
   return( stream );
}



