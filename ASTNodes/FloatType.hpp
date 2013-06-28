/**
 * FloatType.hpp - 
 * @author: Jonathan Beard
 * @version: Tue May 28 08:22:55 2013
 */
#ifndef _FLOATTYPE_HPP_
#define _FLOATTYPE_HPP_  1

#include "Type.hpp"

namespace Node{

class FloatType : public Type {
public:
   FloatType();
   virtual ~FloatType();

   virtual bool IsType( long double value );
protected:
   /**
    *  convenience constructor for sub-classes,
    *  sets the proper name, min and max 
    *  @param  n  std::string
    *  @param  min   long double
    *  @param  max   long double
    */
   FloatType( const std::string n, 
              long double min,
              long double max );

   long double min;
   long double max;
};

} /* end namespace Node */

#endif /* END _FLOATTYPE_HPP_ */
