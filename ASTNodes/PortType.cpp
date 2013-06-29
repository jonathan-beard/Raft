/**
 * XPort.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 10:19:58 2013
 */
#include <cstdlib>
#include <cassert>
#include <sstream>
#include <string>

#include "XPort.hpp"


using namespace Node;

Port::Port() : Type( "PortType" ),
               direction( PortDirection::NOTSET ),
               port_type( nullptr ),
               flow_type( nullptr )
{
   /* nothing to do here */
}

Port::Port( const std::string n,
            Type  *p_type,
            DataFlow *f_type ) : 

Port::~Port()
{
   if( port_type != nullptr )
   {
      delete( port_type );
      port_type = nullptr;
   }   
   if( flow_type != nullptr )
   {
      delete( flow_type );
      flow_type = nullptr;
   }
   direction = PortDirection::NOTSET;
   name.clear();
}

void Port::set_direction( PortDirection d )
{
   assert( d != PortDirection::NOTSET );
   assert( this->direction == PortDirection::NOTSET );
   this->direction = d;
}

PortDirection Port::get_direction()
{
   return( direction );
}

void Port::set_port_type( Type *t )
{
   assert( t != nullptr );
   assert( this->port_type == nullptr );
   this->port_type = t;
}

Type* Port::get_port_type()
{
   return( port_type );
}

void Port::set_name( std::string name )
{
   assert( name.length() > 0 );
   this->name = name;
}

std::string Port::get_name()
{
   return( name );
}

void Port::set_flow_type( DataFlow *flow_type )
{
   assert( flow_type != nullptr );
   assert( this->flow_type == nullptr );
   this->flow_type = flow_type;
}

DataFlow* Port::get_flow_type()
{
   return( flow_type );
}

std::ostream&  Port::print( std::ostream &stream )
{
   stream << name << " " << name_map[ direction ] << " ";
   stream << port_type->get_type_string() << " ";
   stream << flow_type->toString();
   return( stream );
}

std::string Port::toString(){
   std::stringstream ss;
   this->print( ss );
   return( ss.str() );
}
