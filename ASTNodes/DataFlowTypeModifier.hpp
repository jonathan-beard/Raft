/**
 * DataFlowTypeModifier.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jun 29 15:58:12 2013
 */
#ifndef _DATAFLOWTYPEMODIFIER_HPP_
#define _DATAFLOWTYPEMODIFIER_HPP_  1

#include <string>
#include <cinttypes>
#include <cstdint>
#include "TypeModifier.hpp"

namespace Node{

class DataFlowTypeModifier : public TypeModifier 
{
public:
   enum FlowValue { MIN, MAX, MEAN, STD };
   
   /* default constructor */
   DataFlowTypeModifier();
   virtual ~DataFlowTypeModifier();

   /**
    * GetFlowValue - Virtual function to be defined by
    * sub-classes.  This function returns the min or 
    * max count for the value specified, either MIN,
    * MAX, MEAN, STD.  If a particular value isn't 
    * valid or implemented for the calling class then 
    * a -1 should be returned.
    * @param key - FlowValue
    * @param value - either intmax_t or long double
    */
   virtual void GetFlowValue( FlowValue key, intmax_t &value ) = 0;
   virtual void GetFlowValue( FlowValue key, long double &value ) = 0;

   /**
    * FlowValue - to be used with GetFlowValue
    */
protected:
   DataFlowTypeModifier( const std::string name );
};

} /* end namespace Node */
#endif /* END _DATAFLOWTYPEMODIFIER_HPP_ */
