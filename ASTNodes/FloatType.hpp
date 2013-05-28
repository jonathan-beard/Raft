/**
 * FloatType.hpp - 
 * @author: Jonathan Beard
 * @version: Tue May 28 08:22:55 2013
 */
#ifndef _FLOATTYPE_HPP_
#define _FLOATTYPE_HPP_  1

#include "Types.hpp"

namespace Node{

class FloatType : public Type {
public:
   FloatType();
   virtual ~FLoatType();

   virtual bool IsType( long double value );
protected:
   long double min;
   long double max;
};

} /* end namespace Node */

#endif /* END _FLOATTYPE_HPP_ */
