/**
 * TypeModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 15:51:44 2013
 */
#include "TypeModifier.hpp"

using namespace Node;

TypeModifier::TypeModifier() : NodeAbstract(),
                               name( "BaseModifier" )
{
   /* nothing to do here */
}

TypeModifier::~TypeModifier()
{ 
   /* nothing do destroy */
}

std::string
TypeModifier::get_name()
{
   return( name );
}
