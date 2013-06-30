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
    * @param value - FlowValue
    * @return  intmax_t
    */
   virtual intmax_t GetFlowValue( FlowValue value ) = 0;

   /**
    * FlowValue - to be used with GetFlowValue
    */
protected:
   DataFlowTypeModifier( const std::string name );
};

} /* end namespace Node */
#endif /* END _DATAFLOWTYPEMODIFIER_HPP_ */
