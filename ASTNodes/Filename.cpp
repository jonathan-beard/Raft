/**
 * Filename.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Jul 23 10:12:49 2013
 */
#include "Filename.hpp"

using namespace Node;

Filename::Filename( std::string n ) : NodeAbstract( "Filename" ),
                                      filename( n )
{
}

std::ostream&
Filename::print( std::ostream &stream )
{
   NodeAbstract::print( stream ) << std::string(" ") << this->filename;
   return( stream );
}

