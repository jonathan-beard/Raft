/**
 * Declaration.cpp - 
 * @author: Jonathan Beard
 * @version: Wed May 29 08:59:18 2013
 */
#include <cassert>
#include "Declaration.hpp"

using namespace Node;

Declaration::Declaration() : NodeAbstract( "Declaration" )
{

}

Declaration::Declaration( const std::string name ) : NodeAbstract( name )
{

}
