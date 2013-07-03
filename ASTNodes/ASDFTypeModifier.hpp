/**
 * ASDFTypeModifier.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jun 29 15:58:12 2013
 */
#ifndef _ASDFTYPEMODIFIER_HPP_
#define _ASDFTYPEMODIFIER_HPP_  1

#include "DataFlowTypeModifier.hpp"

namespace Node{
class ASDFTypeModifier : public DataFlowTypeModifier {
public:
   ASDFTypeModifier();
   virtual ~ASDFTypeModifier();
   
   virtual void set_minimum_flow( intmax_t minimum );
   virtual void set_maximum_flow( intmax_t maximum );
   virtual void set_mean_flow( long double mean );
   virtual void set_std_flow( long double std );

   virtual void GetFlowValue( FlowValue key, intmax_t &value );
   virtual void GetFlowValue( FlowValue key, long double &value );

protected:
   ASDFTypeModifier( const std::string n,
                     intmax_t minimum,
                     intmax_t maximum,
                     long double mean,
                     long double std );
   intmax_t min;
   intmax_t max;
   long double mean_flow;
   long double std_flow;
}; /* END ASDFTypeModifier */

} /* end namespace Node */
#endif /* END _ASDFTYPEMODIFIER_HPP_ */
