/**
 * AutoType.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Nov 14 15:00:30 2013
 */
#include "AutomaticType.hpp"

using namespace Node;

AutomaticType::AutomaticType() : Type("AutomaticType")
{
   //nothing to do
   class_tree.addRelation( typeid( Node::Type ).hash_code(),
                           typeid( Node::AutomaticType ).hash_code() );
}


bool 
AutomaticType::IsType( uintmax_t value )
{
   return( true );
}

bool 
AutomaticType::IsType( long double value )
{
   return( true );
}

bool 
AutomaticType::IsType( std::string value )
{
   return( true );
}
