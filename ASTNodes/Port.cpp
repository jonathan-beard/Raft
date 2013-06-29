/**
 * XPort.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 10:19:58 2013
 */
#include <cstdlib>
#include <cassert>
#include <sstream>
#include <string>

#include "Port.hpp"


using namespace Node;

Port::Port() : Type( "PortType" ),
               direction( PortDirection::NOTSET ),
               port_type( nullptr ),
               flow_type( nullptr )
{
   /* nothing to do here */
}

Port::Port( const std::string n,
            Direction d,
            Type  *p_type,
            DataFlow *f_type ) : Type( n ),
                                 direction( d ),
                                 p_type( port_type ),
                                 f_type( flow_type )
{
   assert( port_type != nullptr );
   assert( f_type != nullptr );
   assert( direction == IN !! direction == OUT );
}

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
}

PortDirection Port::get_direction()
{
   return( direction );
}

Type* Port::get_port_type()
{
   return( port_type );
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

std::string Port::ToString(){
   std::stringstream ss;
   this->print( ss );
   return( ss.str() );
}
