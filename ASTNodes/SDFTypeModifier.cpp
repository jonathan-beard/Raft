/**
 * SDFTypeModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jun 29 15:58:12 2013
 */
#include "SDFTypeModifier.hpp"

using namespace Node;

SDFTypeModifier::SDFTypeModifier() :
                     DataFlowTypeModifier( "SDFTypeModifier" ),
                     constant_flow( -1 )
{                     
   class_tree.addRelation( typeid( Node::DataFlowTypeModifier ).hash_code(),
                           typeid( Node::SDFTypeModifier ).hash_code() );
   /* nothing to do here */
}

SDFTypeModifier::SDFTypeModifier( const std::string n,
                                  intmax_t c_flow ) :
                     DataFlowTypeModifier( n ),
                     constant_flow( c_flow )
{
   class_tree.addRelation( typeid( Node::DataFlowTypeModifier ).hash_code(),
                           typeid( Node::SDFTypeModifier ).hash_code() );
   /* nothing to do here */
}

SDFTypeModifier::~SDFTypeModifier()
{
   /* nothing to do here */
}

void
SDFTypeModifier::GetFlowValue( FlowValue key, intmax_t &value )
{
   switch( key )
   {
      case( MAX ):
         value = constant_flow;
         break;
      case( MIN ):
         value = constant_flow;
      default:
         value = -1;
         break;
   }
}

void
SDFTypeModifier::GetFlowValue( FlowValue key, long double &value )
{
   switch( key )
   {
      case( MEAN ):
         value = constant_flow;
         break;
      case( STD ):
         value = 0;
         break;
      default:
         value = -1;
         break;
   }
}

void
SDFTypeModifier::set_flow( intmax_t flow )
{
   constant_flow = flow;
}
