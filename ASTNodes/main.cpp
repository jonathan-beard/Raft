#include <iostream>
#include <cstdlib>
#include <string>
#include <cstdint>

#include "NodeAbstract.hpp"
#include "DefaultVisitor.hpp"


int
main( int argc, char **argv )
{
   Node::NodeAbstract root;
   Node::NodeAbstract nodeone;
   root.print( std::cout ) << "\n";
   nodeone.print( std::cout ) << "\n";
   return( EXIT_SUCCESS );
}
