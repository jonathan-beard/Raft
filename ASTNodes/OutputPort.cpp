/**
 * OutputPort.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jun 30 15:00:07 2013
 */
#include "OutputPort.hpp"

using namespace Node;

OutputPort::OutputPort( Type *t, DataFlowTypeModifier *flow ) :
                              Port( "OutputPort",
                                    OUT,
                                    t,
                                    flow )
{
   /* nothing to do here */
}

OutputPort::~OutputPort()
{
   /* nothing to do here */
}
