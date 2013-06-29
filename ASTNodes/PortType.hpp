/**
 * PortType.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 10:19:58 2013
 */
#ifndef _PORTTYPE_HPP_
#define _PORTTYPE_HPP_  1

#include "Type.hpp"
#include "DataFlow.hpp"

namespace Node{

enum PortDirection : int { NOTSET = 0, IN, OUT };

class Port : public Type{
public:
   Port();


   virtual ~Port();

   void  set_direction( PortDirection d );

   /**
    * get_direction - returns the direction of the port
    * @return PortDirection enum type
    */
   PortDirection  get_direction();

   /* various get & set methods */
   void  set_port_type( Type *t );
   Type* get_port_type();

   void  set_name( std::string name );
   std::string get_name();

   void  set_flow_type( DataFlow *flow_type );
   DataFlow*   get_flow_type( );

   std::ostream& print( std::ostream &stream );
   std::string   toString();

protected:
   Port( const std::string n,
         Type *p_type,
         DataFlow *f_type );

   PortDirection direction;
   Type          *port_type;
   DataFlow      *flow_type;

   std::string name_map[3] = {
        "NotSet" ,
        "In"     ,
        "Out"    
   };
};

} /* end namespace X */

#endif /* END _PORTTYPE_HPP_ */
