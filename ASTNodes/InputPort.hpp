/**
 * InputPort.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jun 30 15:00:07 2013
 */
#ifndef _INPUTPORT_HPP_
#define _INPUTPORT_HPP_  1

#include "Port.hpp"

namespace Node{

class InputPort : public Port
{
public:
   InputPort( Type *t, DataFlowTypeModifier *flow );
   virtual ~InputPort();

protected:
   
}; /* end InputPort */

} /* end namespace Node */
#endif /* END _INPUTPORT_HPP_ */
