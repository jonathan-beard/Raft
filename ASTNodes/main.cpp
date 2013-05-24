#include <iostream>
#include <cstdlib>
#include <string>
#include <cstdint>

#include "NodeAbstract.hpp"
#include "DebugVisitor.hpp"

namespace Node{
   class NodeAbstract;
}

namespace Visitor{
   class DebugVisitor;
   class DefaultVisitor;
}

int
main( int argc, char **argv )
{
   Node::NodeAbstract *root = new Node::NodeAbstract();
   Node::NodeAbstract *nodeone = new Node::NodeAbstract();
   nodeone->set_name("NodeOne");
   Node::NodeAbstract *nodetwo = new Node::NodeAbstract();
   nodetwo->set_name("NodeTwo");

   root->AdoptChildren( nodeone );
   root->AdoptChildren( nodetwo );

   Visitor::DebugVisitor debug_visitor;
   root->Accept( debug_visitor );

   /* only need to delete the root */
   delete( root );

   return( EXIT_SUCCESS );
}
