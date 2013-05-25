/**
 * XTypes.cpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 10:22:00 2013
 */
#include <cassert>
#include "XTypes.hpp"


using namespace X;


const Type::ValidTypes Type::typenames[] = {
   { ValidType::UNSIGNED8, "UNSIGNED8" , &Type::Create  },
   { ValidType::UNSIGNED16, "UNSIGNED16", &Type::Create },
   { ValidType::UNSIGNED32, "UNSIGNED32", &Type::Create },
   { ValidType::UNSIGNED64, "UNSIGNED64", &Type::Create },
   { ValidType::SIGNED8,  "SIGNED8", &Type::Create  },
   { ValidType::SIGNED16, "SIGNED16", &Type::Create },
   { ValidType::SIGNED32, "SIGNED32", &Type::Create },
   { ValidType::SIGNED64, "SIGNED64", &Type::Create },
   { ValidType::FLOAT32, "FLOAT32", &Type::Create },
   { ValidType::FLOAT64, "FLOAT64", &Type::Create },
   { ValidType::FLOAT96, "FLOAT96", &Type::Create },
   { ValidType::STRING, "STRING", &Type::Create }
};



Type* Type::GetTypeFor( std::string type_string )
{
   assert( type_string.length() > 0 );
   Type *out( nullptr );
   for( ValidType type = ValidType::UNSIGNED8; 
        type < ValidType::N ; type++ )
   {
      if( type_string.compare( typenames[ type ].name ) == 0 ){
         out = typenames[ type ].create( type );
         break;
      }
   }
   assert( out != nullptr );
   return( out );
}

std::ostream& Type::Print( std::ostream &stream )
{
   stream << my_type;

   return( stream );
}

ValidType Type::get_type()
{
   return( my_type );
}

std::string Type::get_type_string()
{
   return( typenames[ my_type ].name );
}

Type* Type::Create( ValidType type )
{
   assert( type < ValidType::N );
   assert( type >= 0 );
   return( new Type( type ) );
}
