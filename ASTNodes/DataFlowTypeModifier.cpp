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
   class_tree.addRelation( typeid( Node::TypeModifier ).hash_code(),
                           typeid( Node::DataFlowTypeModifier ).hash_code() );

}

DataFlowTypeModifier::DataFlowTypeModifier( const std::string n ) :
                           TypeModifier( n )
{
   class_tree.addRelation( typeid( Node::TypeModifier ).hash_code(),
                           typeid( Node::DataFlowTypeModifier ).hash_code() );
}

DataFlowTypeModifier::~DataFlowTypeModifier()
{

}
