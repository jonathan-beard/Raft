/**
 * OutputPort.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jun 30 15:00:07 2013
 */
#ifndef _OUTPUTPORT_HPP_
#define _OUTPUTPORT_HPP_  1

#include "Port.hpp"

namespace Node{

class OutputPort : public Port
{
public:
   OutputPort( Type *t, DataFlowTypeModifier *flow );
   virtual ~OutputPort();

}; /* end class OutputPort */

} /* end namespace Node */
#endif /* END _OUTPUTPORT_HPP_ */
