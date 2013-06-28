/**
 * Declaration.cpp - 
 * @author: Jonathan Beard
 * @version: Wed May 29 08:59:18 2013
 */
#include <cassert>

#include "Declaration.hpp"
#include "Type.hpp"
#include "Initializer.hpp"


using namespace Node;

Declaration::Declaration( Type *t, 
                          std::string *n,
                          Initializer *i )
                          : NodeAbstract( "Declaration" ),
                            decl_type( nullptr ),
                            init( nullptr )
{
   assert( t != nullptr );
   assert( n != nullptr );
   /* default initializer */
   decl_type = t;
   decl_name = *n;
   assert( decl_name.length() > 0 );
   delete( n );
   if( i == nullptr )
   {
      /* get default initializer */
      init = get_type().GetDefaultInitializer();
   }
   else
   {
      init = i;
   }
}

Declaration::~Declaration()
{
   assert( decl_type != nullptr );
   assert( init != nullptr );
   delete( decl_type );
   delete( init );
}

std::ostream&
Declaration::print( std::ostream &stream )
{
   std::ostream &ret( NodeAbstract::print( stream ) );
   ret << decl_type << get_type().ToString() 
      << " " << get_name() << 
      " " << get_decl_initializer().ToString();
   return( stream );
}

Type&
Declaration::get_decl_type()
{
   return( *decl_type );
}

std::string
Declaration::get_decl_name()
{
   return( decl_name );
}

Initializer&
Declaration::get_decl_initializer()
{
   /* make sure this puppy isn't null before returning a ptr */
   assert( init != nullptr );
   return( *init );
}

void
Declaration::set_modifier( TypeModifier *m )
{
   assert( m != nullptr );
   modifier = m;
}

TypeModifier&
Declaration::get_modifier()
{
   assert( modifier != nullptr );
   return( *modifier );
}
