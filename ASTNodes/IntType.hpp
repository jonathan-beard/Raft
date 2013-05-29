/**
 * IntType.hpp - 
 * @author: Jonathan Beard
 * @version: Sun May 26 14:20:07 2013
 */
#ifndef _INTTYPE_HPP_
#define _INTTYPE_HPP_  1

#include <cinttypes>
#include <cstdint>
#include "Type.hpp"

namespace Node {
class Initializer;

class IntType : public Type {
public:
   IntType();
   virtual ~IntType();   
   virtual bool IsType( uintmax_t value );

   virtual Initializer* GetDefaultInitializer();
protected:
   uintmax_t max;
   intmax_t  min;
};

} /* end namespace Node */

#endif /* END _INTTYPE_HPP_ */
