/**
 * XDataFlow.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 13:15:17 2013
 */
#include <cassert>

#include "XDataFlow.hpp"
#include "XAsynchDataFlow.hpp"
#include "XSynchDataFlow.hpp"

using namespace X;

DataFlow* DataFlow::GetDataFlow( size_t count )
{
   DataFlow *out( nullptr );
   out = new SynchDataFlow( count );
   assert( out != nullptr );
   return( out );
}

DataFlow* DataFlow::GetDataFlow( size_t min,
                                 size_t max )
{  
   DataFlow *out( nullptr );
   out = new AsynchDataFlow( min, max );
   assert( out != nullptr );
   return( out );
}

bool DataFlow::IsSynchronous()
{
   return( synchronous );
}
