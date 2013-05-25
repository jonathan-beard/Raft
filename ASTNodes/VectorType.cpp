/**
 * VectorType.cpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 15:24:30 2013
 */
#include "VectorType.hpp"

VectorType::VectorType( size_t s )
   :  NodeAbstract(),
      size( s )
{
   
}

VectorType::~VectorType(){};

size_t
VectorType::get_size()
{
   return( size );
}
