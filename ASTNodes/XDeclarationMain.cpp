#include <iostream>
#include <string>
#include <cstdlib>

#include "XTypes.hpp"
#include "XDeclaration.hpp"

using namespace X;

int
main( const int argc, const char **argv){
   Declaration decl;
   
   Type *t = Type::GetTypeFor( "UNSIGNED64" );
   decl.set_type( t );
   decl.set_name( "foo" );
   decl.set_value( "3008" );
   
   decl.print( std::cout );

   return( EXIT_SUCCESS );
}
