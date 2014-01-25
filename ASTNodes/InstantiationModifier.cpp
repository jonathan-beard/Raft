/**
 * InstantiationModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan 25 06:06:30 2014
 */
#include "InstantiationModifier.hpp"

using namespace Node;

InstantiationModifier::InstantiationModifier() : 
                  NodeAbstract( "InstantiationModifier" )
{
}

InstantiationModifier::InstantiationModifier( const std::string name )
                  : NodeAbstract( name )
{
}
