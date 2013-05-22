/**
 * command_option_multiple.hpp - 
 * @author: Jonathan Beard
 * @version: Tue May 21 15:12:50 2013
 */
#ifndef _COMMAND_OPTION_MULTIPLE_HPP_
#define _COMMAND_OPTION_MULTIPLE_HPP_  1

#include <cassert>
#include <array>
#include <functional>
#include <typeinfo>
#include <cstdint>
#include <cstdlib>
#include "command_option_base.hpp"

template <class T, int N> class OptionMultiple : public OptionBase {
public:
   OptionMultiple( std::array<T*, N > Items,
                   std::string        Flag,
                   std::string        Description,
               std::array< std::function< T (const char* , bool&) >,N > Functions )
                     : OptionBase( Flag, Description, false ),
                       items( Items ),
                       F( Functions ) 
   {
         /* assert what types are allowed */
         assert( typeid(T) == typeid(bool) ||
                 typeid(T) == typeid(int64_t) ||
                 typeid(T) == typeid(double) ||
                 typeid(T) == typeid(std::string) );
         /* else fail assertion */
   }

   virtual std::string 
   toString()
   {
      return( OptionBase::toString( format_item( *items.front() ) ) );
   }

   virtual bool  
   setValue( const char* value )
   {  
      assert( value != nullptr );
      assert( F.size() == items.size() );
      auto it_function( F.begin() );
      auto it_item( items.begin() );
      for( ; it_function != F.end(); ++it_function, ++it_item )
      {
         bool success( true );
         *(*it_item) = (*it_function)( value , success );
         if( ! success ){
            return( false );
         }
      }
      return( true );
   }


private:
   std::string format_item( T x ){
      std::stringstream out;
      out << x;
      if( typeid(x) == typeid(bool) ){
         if( *((bool*)(&x))  == true){
            return("true");
         }else{
            return("false");
         }
      }else if( typeid(x) == typeid(double) ){
         char buffer[100];
         memset(buffer, '\0', sizeof(char) * 100);
         snprintf(buffer, 100, "%0.3f", *((double*)(&x)));
         std::stringstream ss;
         ss << buffer;
         return( ss.str() );
      }
      /* this should be the string case */ 
      return( out.str() );
   }

   std::array<T*, N> items;
   std::array< std::function< T ( const char* , bool&) >, N > F;
};

#endif /* END _COMMAND_OPTION_MULTIPLE_HPP_ */
