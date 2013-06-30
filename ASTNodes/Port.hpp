/**
 * PortType.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 10:19:58 2013
 */
#ifndef _PORTTYPE_HPP_
#define _PORTTYPE_HPP_  1

#include "Type.hpp"
#include "DataFlowTypeModifier.hpp"

namespace Node{


class Port : public Type{
public:
   enum PortDirection : int { NOTSET = 0, IN, OUT };
   
   Port();

   virtual ~Port();
   
   /**
    * get_direction - returns the direction of the port
    * @return PortDirection enum type
    */
   PortDirection  get_direction();

   /* various get methods */
   Type* get_port_type();

   DataFlowTypeModifier*   get_flow_type( );

   std::ostream& print( std::ostream &stream );
   std::string   ToString();

protected:
   Port( const std::string n,
         PortDirection d,
         Type *p_type,
         DataFlowTypeModifier *f_type );

   PortDirection              direction;
   Type                       *port_type;
   DataFlowTypeModifier       *flow_type;

   std::string name_map[3] = {
        "NotSet" ,
        "In"     ,
        "Out"    
   };
};

} /* end namespace X */

#endif /* END _PORTTYPE_HPP_ */
