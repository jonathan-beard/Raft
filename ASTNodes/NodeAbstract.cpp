/**
 * NodeAbstract.cpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 09:20:17 2013
 */
#include "NodeAbstract.hpp"

/* private static variables */
int64_t NodeAbstract::number_of_nodes = 0;

/* constructors */
NodeAbstract::NodeAbstract() : node_number( NodeAbstract::number_of_nodes++ ),
                               parent( nullptr ),
                               child( nullptr ),
                               name("NodeAbstract")
{
   
}



/* destructors */
NodeAbstract::~NodeAbstract()
{
   if( child != nullptr )
   {
      delete( child );
      child = nullptr;
   }
   foreach( NodeAbstract *node : siblings )
   {
      if( node != nullptr )
      {
          delete( node );
          node = nullptr;
      }
   }
   node_number = -1;
   parent = nullptr;
}


