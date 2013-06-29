/**
 * XPort.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 10:19:58 2013
 */
#ifndef _XPORT_HPP_
#define _XPORT_HPP_  1

#include "Type.hpp"
#include "DataFlow.hpp"

namespace Node{

enum PortDirection : int { NOTSET = 0, IN, OUT };

class Port : public Type{
public:
   Port() : Type( "PortType" ),
            direction( PortDirection::NOTSET ),
            port_type( nullptr ),
            flow_type( nullptr ){};

   virtual ~Port();

   void  set_direction( PortDirection d );
   PortDirection  get_direction();

   void  set_port_type( Type *t );
   Type* get_port_type();

   void  set_name( std::string name );
   std::string get_name();

   void  set_flow_type( DataFlow *flow_type );
   DataFlow*   get_flow_type( );

   std::ostream& print( std::ostream &stream );
   std::string   toString();

private:

   PortDirection direction;
   Type          *port_type;
   std::string   name;
   DataFlow      *flow_type;

   std::string name_map[3] = {
        "NotSet" ,
        "In"     ,
        "Out"    
   };
};

} /* end namespace X */

#endif /* END _XPORT_HPP_ */
