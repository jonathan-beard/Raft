/**
 * Initializer.cpp - 
 * @author: Jonathan Beard
 * @version: Wed May 29 15:12:21 2013
 */
#include <cassert>
#include "Initializer.hpp"

Initializer::Initializer()
{
   /* shouldn't be here, this is just here to fool you */
   assert( false );
}

Initializer::Initializer( std::string v ) :
         string_value( v ),
         int_value( 0 ),
         uint_value( 0 ),
         bool_value( false ),
         set_type( STRING )
{

}

Initializer::Initializer( intmax_t v ) :
         string_value( "" ),
         int_value( v ),
         uint_value( 0 ),
         bool_value( false ),
         set_type( INT )
{

}

Initializer::Initializer( uintmax_t v ) :
         string_value( "" ),
         int_value( 0 ),
         uint_value( v ),
         bool_value( false ),
         set_type( UINT )
{

}

Initializer::Initializer( bool v ) :
         string_value( "" ),
         int_value( 0 ),
         uint_value( 0 ),
         bool_value( v ),
         set_type( BOOL )
{

}

Initializer::~Initializer()
{
   /* nothing to destroy at the moment */
}


bool
Initializer::IsString()
{
   return( set_type == STRING );
}

bool
Initializer::IsInt()
{
   return( set_type == INT );
}

bool
Initializer::IsUInt()
{
   return( set_type == UINT );
}

bool
Initializer::IsBool()
{
   return( set_type == BOOL );
}

std::string
Initializer::GetValue()
{
   assert( set_type == STRING );
   return( string_value );
}

intmax_t
Initializer::GetValueInt()
{
   assert( set_type == INT );
   return( int_value );
}

uintmax_t
Initializer::GetValueUInt()
{
   assert( set_type == UINT );
   return( uint_value );
}


bool
Initializer::GetValueBool()
{  
   assert( set_type == BOOL );
   return( bool_value );
}
