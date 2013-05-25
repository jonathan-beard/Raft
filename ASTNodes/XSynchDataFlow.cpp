/**
 * XSynchDataFlow.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 14:42:11 2013
 */
#include "XSynchDataFlow.hpp"

using namespace X;

SynchDataFlow::SynchDataFlow( size_t count ) : DataFlow( true ),
                                               my_count( count )
{
 /* nothing at the moment */   
}

SynchDataFlow::~SynchDataFlow(){}


size_t SynchDataFlow::get_count()
{
   return( my_count );
}

size_t SynchDataFlow::get_min_count()
{
   return( my_count );
}

size_t SynchDataFlow::get_max_count()
{
   return( my_count );
}

std::ostream& SynchDataFlow::print( std::ostream &stream )
{
   stream << "SDF " << my_count;
   return( stream );
}

std::string SynchDataFlow::toString()
{
   std::stringstream ss;
   print( ss );
   return( ss.str() );
}
