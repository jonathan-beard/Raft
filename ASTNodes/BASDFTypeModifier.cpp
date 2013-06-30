/**
 * BASDFTypeModifier.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jun 29 15:58:12 2013
 */
#include "BASDFTypeModifier.hpp"

using namespace Node;

BASDFTypeModifier::BASDFTypeModifier() :
                        DataFlowTypeModifier( "BASDFTypeModifier" ),
                        min( -1 ),
                        max( -1 ),
                        mean_flow( -1.0 ),
                        std_flow( -1.0 )
{
   /* nothing to do here */
}

BASDFTypeModifier::BASDFTypeModifier( 
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
   /* nothing to do here */
}

void
BASDFTypeModifier::set_minimum_flow( intmax_t minimum )
{
   min = minimum;
}

void
BASDFTypeModifier::set_maximum_flow( intmax_t maximum )
{
   max = maximum;
}


void
BASDFTypeModifier::set_mean_flow( long double mean )
{
   mean_flow = mean;
}

void
BASDFTypeModifier::set_std_flow( long double std )
{
   std_flow = std;
}

void
BASDFTypeModifier::GetFlowValue( FlowValue key, intmax_t &value )
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
BASDFTypeModifier::GetFlowValue( FlowValue key, long double &value )
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
