/**
 * DataFlowTypeModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jun 29 15:58:12 2013
 */
#include "DataFlowTypeModifier.hpp"

using namespace Node;

DataFlowTypeModifier::DataFlowTypeModifier() :
                           TypeModifier( "DataFlowTypeModifier" )
{

}

DataFlowTypeModifier::DataFlowTypeModifier( const std::string n ) :
                           TypeModifier( n )
{

}

DataFlowTypeModifier::~DataFlowTypeModifier()
{

}
