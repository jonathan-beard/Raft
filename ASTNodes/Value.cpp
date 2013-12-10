/**
 * Value.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Nov  7 07:35:26 2013
 */
#include "Value.hpp"
#include <cstring>
#include <cassert>

using namespace Node;

/**
 * basic constructor, set this object's value
 * to the param string
 */
Value::Value( T value ) : NodeAbstract(),
                          value( value )
{
   //Nothing more to do here
   TODO: test this feature
   set_name( std::to_string( value ) );
}


bool
Value::get_value( Value::TYPE type, void *ptr )
{
   if( this.type == type )
   {
      assert( ptr != nullptr );
      memcpy( ptr, &value, sizeof( T ) );
      return( true );
   }
   else
   {
      return( false );
   }
}
