/**
 * Type.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#include "Initializer.hpp"
#include "Type.hpp"
#include "NodeAbstract.hpp"

#include <cassert>
using namespace Node;

Type::Type() : NodeAbstract( "AbstractType" )
{
   /* nothing to do */
}

Type::Type( const std::string n ) : NodeAbstract( n )
{
   /* nothing really to do */
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
Type::IsType( std::string value )
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
   stream << (this)->ToString();
   return( stream );
}

std::string
Type::ToString()
{
   return( name );
}  
   
Initializer* 
Type::GetDefaultInitializer()
{
   /* die if this is the one beign called... */
   assert( false );
   return( nullptr );
}
