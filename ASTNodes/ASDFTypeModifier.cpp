/**
 * ASDFTypeModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jun 29 15:58:12 2013
 */
#include "ASDFTypeModifier.hpp"

using namespace Node;

ASDFTypeModifier::ASDFTypeModifier() :
                        DataFlowTypeModifier( "ASDFTypeModifier" ),
                        min( -1 ),
                        max( -1 ),
                        mean_flow( -1.0 ),
                        std_flow( -1.0 )
{
   /* nothing to do here */
   class_tree.addRelation( typeid( Node::DataFlowTypeModifier ).hash_code(),
                           typeid( Node::ASDFTypeModifier ).hash_code() );
}

ASDFTypeModifier::ASDFTypeModifier( 
                        const std::string n,
                        intmax_t minimum,
                        intmax_t maximum,
                        long double mean,
                        long double std ) :
                           DataFlowTypeModifier( n ),
                           min( minimum ),
                           max( maximum ),
                           mean_flow( mean),
                           std_flow( std )
{
   class_tree.addRelation( typeid( Node::DataFlowTypeModifier ).hash_code(),
                           typeid( Node::ASDFTypeModifier ).hash_code() );
   /* nothing to do here */
}

ASDFTypeModifier::~ASDFTypeModifier()
{
   /* nothing really to do */
}

void
ASDFTypeModifier::set_minimum_flow( intmax_t minimum )
{
   min = minimum;
}

void
ASDFTypeModifier::set_maximum_flow( intmax_t maximum )
{
   max = maximum;
}


void
ASDFTypeModifier::set_mean_flow( long double mean )
{
   mean_flow = mean;
}

void
ASDFTypeModifier::set_std_flow( long double std )
{
   std_flow = std;
}

void
ASDFTypeModifier::GetFlowValue( FlowValue key, intmax_t &value )
{
   switch( key )
   {
      case( MIN ):
         value = min;
         break;
      case( MAX ):
         value =  max;
         break;
      default:
         value = -1;
   }
}

void
ASDFTypeModifier::GetFlowValue( FlowValue key, long double &value )
{
   switch( key )
   {
      case( MEAN ):
         value = mean_flow;
         break;
      case( STD ):
         value = std_flow;
         break;
      default:
         value = -1.0;
         break;
   }
}
