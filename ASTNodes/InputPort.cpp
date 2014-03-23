/**
 * InputPort.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jun 30 15:00:07 2013
 */
#include "InputPort.hpp"

using namespace Node;

InputPort::InputPort( Type *t, DataFlowTypeModifier *flow )
                              : Port( "InputPort",
                                       IN,
                                       t,
                                       flow )
{
   class_tree.addRelation( typeid( Node::DataFlowTypeModifier ).hash_code(),
                           typeid( Node::InputPort ).hash_code() );
   /* nothing to do here */
}

InputPort::~InputPort()
{
   class_tree.addRelation( typeid( Node::DataFlowTypeModifier ).hash_code(),
                           typeid( Node::InputPort ).hash_code() );
   /* nothing to do at the moment */
}
