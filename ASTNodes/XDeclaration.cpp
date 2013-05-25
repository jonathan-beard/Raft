#include <cassert>
#include <sstream>

#include "XDeclaration.hpp"


using namespace X;

Declaration::~Declaration()
{
   if( type != nullptr ){
      delete( type );
      type = nullptr;
   }
   name.clear();
   value.clear();
}

void Declaration::set_type( Type *t )
{
   assert( t != nullptr );
   assert( type == nullptr );
   this->type = t;
}

Type& Declaration::get_type()
{
   return( *type );
}

void Declaration::set_name( std::string name )
{
   assert( name.length() > 0 );
   this->name = name;
}

std::string Declaration::get_name()
{
   return( this->name );
}

void Declaration::set_value( std::string value )
{
   assert( value.length() > 0 );
   this->value = value;
}

std::string Declaration::get_value()
{
   return( this->value );
}

std::string Declaration::toString()
{
   std::stringstream ss;
   ss << type->get_type_string() << " - " << name << " - " << value;
   return( ss.str() );
}

std::ostream& Declaration::print( std::ostream &stream )
{
   stream << this->toString() << "\n";
   return( stream );
}
