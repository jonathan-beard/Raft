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
   class_tree.addRelation( typeid( Node::Type ).hash_code(),
                           typeid( Node::Port ).hash_code() );
   /* nothing to do here */
}

Port::Port( const std::string n,
            PortDirection d,
            Type  *p_type,
            DataFlowTypeModifier *f_type ) : Type( n ),
                                             direction( d ),
                                             port_type( p_type ),
                                             flow_type( f_type )
{
   assert( port_type != nullptr );
   assert( f_type != nullptr );
   assert( direction != NOTSET );
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

Port::PortDirection 
Port::get_direction()
{
   return( direction );
}

Type* 
Port::get_port_type()
{
   return( port_type );
}

DataFlowTypeModifier* 
Port::get_flow_type()
{
   return( flow_type );
}

std::ostream&  
Port::print( std::ostream &stream )
{
   stream << name << " " << name_map[ direction ] << " ";
   stream << port_type->get_name() << " ";
   stream << flow_type->ToString();
   return( stream );
}

std::string Port::ToString(){
   std::stringstream ss;
   this->print( ss );
   return( ss.str() );
}
