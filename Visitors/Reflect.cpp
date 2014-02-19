/**
 * Reflect.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 18 10:31:09 2014
 */
#include <utility>
#include <typeinfo>
#include "Reflect.hpp"
#include "NodeAbstract.hpp"

using namespace Visitor;

void
Reflect::RegisterFunction( size_t hash, Visit v )
{
   function_map.insert( std::make_pair( hash, v ) ); 
}

Visit*
Reflect::GetFunctionFor( Node::NodeAbstract &node )
{
   /** get the hash **/
   const size_t hash( typeid( node ).hash_code() );
   /** try to get a function **/
   auto func( function_map.find( hash ) );
   if( func != function_map.end() )
   {
      return( & (*func).second );
   }
   /** whoops, no function **/
   return( nullptr );
}
