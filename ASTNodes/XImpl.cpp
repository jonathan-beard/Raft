/**
 * XImpl.cpp - 
 * @author: Jonathan Beard
 * @version: Thu Mar 28 11:45:37 2013
 */
#include <cassert>
#include "XImpl.hpp"

using namespace X;

Impl::Impl() : type( ImplType::NOTSET ), 
               impl_name( "" )
{
}

Impl::~Impl()
{
   type = ImplType::NOTSET;
   impl_name.clear();
}

void Impl::set_type( ImplType type )
{
   assert( type > ImplType::NOTSET && type < ImplType::N );
   assert( this->type == ImplType::NOTSET );
   this->type = type;
}

ImplType Impl::get_type()
{
   return( type );
}

void Impl::set_name( std::string name )
{
   assert( name.length() > 0 )
   assert( this->impl_name.length() == 0 );
   this->impl_name = name;
}
