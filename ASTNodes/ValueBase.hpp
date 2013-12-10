/**
 * ValueBase.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Dec 10 08:34:09 2013
 */
#ifndef _VALUEBASE_HPP_
#define _VALUEBASE_HPP_  1

#include "NodeAbstract.hpp"
namespace Node{
class ValueBase : public NodeAbstract {
public:
   ValueBase() = default;
   virtual ~ValueBase() = default;

   virtual bool get_value( const char *typeName, void *ptr ) = 0;
};
} /* end namespace Node */
#endif /* END _VALUEBASE_HPP_ */
