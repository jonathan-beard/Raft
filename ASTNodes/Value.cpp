/**
 * Value.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Nov  7 07:35:26 2013
 */
#include "Value.hpp"

using namespace Node;

/**
 * basic constructor, set this object's value
 * to the param string
 */
Value::Value( std::string value ) : NodeAbstract(),
                                    value( value )
{
   //Nothing more to do here
}


std::string
Value::get_value()
{
   return( value );
}
