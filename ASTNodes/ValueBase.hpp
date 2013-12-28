/**
 * ValueBase.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Dec 10 08:34:09 2013
 */
#ifndef _VALUEBASE_HPP_
#define _VALUEBASE_HPP_  1

#include "Returns.hpp"
namespace Node{
class ValueBase : public Returns {
public:
   ValueBase();
   virtual ~ValueBase() = default;
   
   /**
    * get_value - To get a value that this object was constructed
    * with, pass an initialized ptr (initialized with the proper
    * length for that data type) 
    */
   virtual bool get_value( const char *typeName, void *ptr ) = 0;
};
} /* end namespace Node */
#endif /* END _VALUEBASE_HPP_ */
