/**
 * VariableName.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Dec 12 14:55:09 2013
 */
#include "VariableName.hpp"

using namespace Node;

VariableName::VariableName( const std::string &name ) : NodeAbstract( "VariableName" ),
                                                        varname( name )
{
   /* nothing to do */
}

std::string
VariableName::get_var_name()
{
   return( varname );
}
