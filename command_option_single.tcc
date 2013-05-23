/**
 * command_option_single.hpp - 
 * @author: Jonathan Beard
 * @version: Tue May 21 15:12:42 2013
 */
#ifndef _COMMAND_OPTION_SINGLE_TCC_
#define _COMMAND_OPTION_SINGLE_TCC_  1

#include <functional>
#include <typeinfo>
#include <cassert>
#include <cstdint>
#include <cstdlib>
#include "command_option_base.hpp"

template <class T> class Option : public OptionBase {
   public:
      Option(T &in, 
             std::string Flag, 
             std::string Description,
             std::function< T (const char *, bool&) > Function = nullptr,
             bool Help = false) : OptionBase( Flag, Description, Help ),
                                  item( in ),
                                  F( Function )
      { 
         /* assert what types are allowed */
         assert( typeid(T) == typeid(bool) ||
                 typeid(T) == typeid(int64_t) ||
                 typeid(T) == typeid(double) ||
                 typeid(T) == typeid(std::string) );
         /* else fail assertion */
      }

      virtual ~Option(){ };

      bool  
      setValue( const char* value )
      { 
         if( F != nullptr )
         {
            bool success( true );
            item = F( value , success );
            return( success );
         }
         T theRealValue;
         if( typeid(T) == typeid(bool) )
         {
            if( strcmp( value,  "true" ) == 0 )
            {
               (*(bool*)(&theRealValue)) = true;
            }else if( strcmp( value, "false" ) == 0 )
            {
               (*(bool*)(&theRealValue)) = false;
            }else{
               return( false );
            }
         }else if( typeid( T ) == typeid( int64_t ) )
         {
            errno = 0;
            (*(int64_t*)(&theRealValue)) = strtoll( value, NULL, 10 );
            if( errno != EXIT_SUCCESS ) return( false );
         }else if( typeid( T ) == typeid( double ) )
         {
            errno = 0;
            (*(double*)(&theRealValue)) = strtod( value, NULL );
            if( errno != EXIT_SUCCESS ) return( false );
         }else{
            /* invalid type conversion */
            return( false );
         }
         item = theRealValue; 
         return( true );
      }

      std::string 
      toString()
      {
         return( OptionBase::toString( format_item( item ) ) );
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

      T &item;
      std::function<T (const char*, bool&) > F;
};
#endif /* END _COMMAND_OPTION_SINGLE_TCC_ */
