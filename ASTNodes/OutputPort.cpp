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
   class_tree.addRelation( typeid( Node::Port ).hash_code(),
                           typeid( Node::OutputPort ).hash_code() );
   /* nothing to do here */
}

OutputPort::~OutputPort()
{
   /* nothing to do here */
}
