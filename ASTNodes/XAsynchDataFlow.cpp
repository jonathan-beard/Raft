/**
 * XAsynchDataFlow.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 14:42:11 2013
 */
#include <cassert>
#include "XAsynchDataFlow.hpp"

using namespace X;

AsynchDataFlow::AsynchDataFlow( size_t min, 
                                size_t max ) : DataFlow( false )
{
   assert( min < max );
   my_min = min;
   my_max = max;
   my_count = max;
}

AsynchDataFlow::~AsynchDataFlow(){}


size_t AsynchDataFlow::get_count()
{
   return( my_count );
}

size_t AsynchDataFlow::get_min_count()
{
   return( my_min );
}

size_t AsynchDataFlow::get_max_count()
{
   return( my_max );
}

std::ostream& AsynchDataFlow::print( std::ostream &stream )
{
   stream << "ADF " << my_min << " " << my_max;
   return( stream );
}  

std::string AsynchDataFlow::toString()
{
   std::stringstream ss;
   print( ss );
   return( ss.str() );
}
