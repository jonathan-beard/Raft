/**
 * XTypes.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 10:22:00 2013
 */
#ifndef _XTYPES_HPP_
#define _XTYPES_HPP_  1

#include <iostream>



namespace X {

enum ValidType : int { UNSIGNED8 = 0,
                       UNSIGNED16,
                       UNSIGNED32,
                       UNSIGNED64,
                       SIGNED8,
                       SIGNED16,
                       SIGNED32,
                       SIGNED64,
                       FLOAT32,
                       FLOAT64,
                       FLOAT96,
                       STRING,
                       N };


class Type {
public:
   static Type* GetTypeFor( std::string type_string );
   virtual ~Type(){};
   
   std::ostream& Print( std::ostream &stream );

   X::ValidType get_type();

   std::string get_type_string();



private:
   Type(ValidType type) : my_type( type ){};

   static Type* Create( ValidType type );
   
   struct ValidTypes{
      ValidType t;
      std::string name;
      Type* (*create)( ValidType type );   
   };
   
   static const ValidTypes typenames[];

   ValidType my_type;
};


} /* end namespace X */

#endif /* END _XTYPES_HPP_ */
