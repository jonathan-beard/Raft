/**
 * Initializer.cpp - 
 * @author: Jonathan Beard
 * @version: Wed May 29 15:12:21 2013
 */
#include <cassert>
#include <string>

#include "Initializer.hpp"

using namespace Node;

Initializer::Initializer() : NodeAbstract( "Initializer" )
{
}


Initializer::Initializer( const std::string name ) : NodeAbstract( name )
{
}

