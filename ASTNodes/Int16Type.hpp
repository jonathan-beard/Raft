/**
 * Int16Type.hpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#ifndef _INT16TYPE_HPP_
#define _INT16TYPE_HPP_  1

#include <cstdint>
#include "IntType.hpp"

namespace  Node{

class Int16Type : public IntType {
public:
   Int16Type();
   virtual ~Int16Type();

   virtual bool IsType( int64_t value );
};

} /* end namespace Node */

#endif /* END _INT16TYPE_HPP_ */
