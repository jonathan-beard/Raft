/**
 * XDeclaration.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 10:04:22 2013
 */
#ifndef _XDECLARATION_HPP_
#define _XDECLARATION_HPP_  1

#include <string>
#include "XTypes.hpp"

namespace X{



class Declaration{
public:
   Declaration() :  type( nullptr ){};

   virtual ~Declaration();

   void set_type( Type *t );
   Type& get_type();

   void set_name( std::string name );
   std::string get_name();

   void set_value( std::string value );
   std::string get_value();

   std::string toString();
   std::ostream& print( std::ostream &stream );

private:
   Type *type;
   std::string name;
   std::string value;
};

} /* end namespace X */

#endif /* END _XDECLARATION_HPP_ */
