/**
 * IntType.hpp - 
 * @author: Jonathan Beard
 * @version: Sun May 26 14:20:07 2013
 */
#ifndef _INTTYPE_HPP_
#define _INTTYPE_HPP_  1

#include <cstdint>
#include "Type.hpp"

namespace Node {

class IntType : public Type {
   IntType();
   virtual ~IntType();   
protected:
   bool IntIsType( int64_t value, 
                   const int64_t min, 
                   const int64_t max );
};

} /* end namespace Node */

#endif /* END _INTTYPE_HPP_ */
