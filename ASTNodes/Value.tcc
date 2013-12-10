/**
 * Value.tcc - 
 * @author: Jonathan Beard
 * @version: Thu Nov  7 07:35:26 2013
 */
#ifndef _VALUE_TCC_
#define _VALUE_TCC_  1
#include "ValueBase.hpp"
#include <cstring>

namespace Node {

template <class T> class Value : public ValueBase {
public:
   Value( T input_value ) : ValueBase(),
                            value( input_value )
   {
      /**
       * TODO - this needs to have some assert statements
       * to ensure that the value is convertible by Raft
       * to a string 
       */
      std::stringstream ss;
      ss << value;
      set_name( ss.str() );
   }
   
   virtual ~Value() = default;

   virtual bool get_value( const char *typeName, void *ptr )
   {
      if( std::strcmp( typeName, typeid( T ).name() ) == 0 )
      {
         assert( ptr != nullptr );
         std::memcpy( ptr, &value, sizeof( T ) );
         return( true );
      }
      else
      {
         return( false );
      }
   }

private:
   T value;
};

} /* end namespace Node */

#endif /* END _VALUE_TCC_ */
