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

   virtual intmax_t GetFlowValue( FlowValue value );
protected:

}; /* END ASDFTypeModifier */

} /* end namespace Node */
#endif /* END _ASDFTYPEMODIFIER_HPP_ */
