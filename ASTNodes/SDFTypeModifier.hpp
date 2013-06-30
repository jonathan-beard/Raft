/**
 * SDFTypeModifier.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jun 29 15:58:12 2013
 */
#ifndef _SDFTYPEMODIFIER_HPP_
#define _SDFTYPEMODIFIER_HPP_  1

#include "DataFlowTypeModifier.hpp"

namespace Node{

class SDFTypeModifier : public DataFlowTypeModifier
{
public:
   SDFTypeModifier();
   virtual ~SDFTypeModifier();

   virtual void GetFlowValue( FlowValue key, intmax_t &value);
   virtual void GetFlowValue( FlowValue key, long double &value );

   virtual void set_flow( intmax_t flow );

protected:
   SDFTypeModifier( const std::string n /* node name */ ,
                    intmax_t c_flow /* constant flow */ );

   intmax_t constant_flow;

}; /* end class SDFTypeModifier */

} /* end namespace Node */

#endif /* END _SDFTYPEMODIFIER_HPP_ */
