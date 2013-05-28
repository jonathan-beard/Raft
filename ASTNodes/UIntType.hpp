/**
 * UIntType.hpp - 
 * @author: Jonathan Beard
 * @version: Mon May 27 14:03:20 2013
 */
#ifndef _UINTTYPE_HPP_
#define _UINTTYPE_HPP_  1

#include <cstdint>
#include "Type.hpp"

namespace Node{

class UIntType : public Type {
public:
   UIntType();
   virtual ~UIntType();

   virtual bool IsType( uintmax_t value );
protected:
   uintmax_t max;
   uintmax_t min;
};

} /* end namespace Node */

#endif /* END _UINTTYPE_HPP_ */
