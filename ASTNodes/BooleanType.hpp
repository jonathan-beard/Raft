/**
 * BooleanType.hpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#ifndef _BOOLEANTYPE_HPP_
#define _BOOLEANTYPE_HPP_  1
#include <string>
#include <cstdint>
#include "Type.hpp"

namespace Node{
class Initializer;

class BooleanType : public Type {
public:
   BooleanType();
   virtual ~BooleanType();
   
   /**
    * IsType - overrides default bahavior
    * for IsType
    */
   virtual  bool IsType( uintmax_t value );
   virtual  bool IsType( std::string *value );
   
   virtual Initializer* GetDefaultInitializer();
};

} /* end namespace Node */

#endif /* END _BOOLEANTYPE_HPP_ */
