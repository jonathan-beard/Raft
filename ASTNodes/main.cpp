#include <iostream>
#include <cstdlib>
#include <string>
#include <cstdint>

#include "NodeAbstract.hpp"
#include "DebugVisitor.hpp"

#include "ap_data.hpp"

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
   AP::AP_Data data;
   Node::NodeAbstract *root = new Node::NodeAbstract();
   Node::NodeAbstract *nodeone = new Node::NodeAbstract();
   nodeone->set_name("NodeOne");
   Node::NodeAbstract *nodetwo = new Node::NodeAbstract();
   nodetwo->set_name("NodeTwo");
   Node::NodeAbstract *nodethree = new Node::NodeAbstract();
   nodethree->set_name("NodeThree");

   root->AdoptChildren( nodeone );
   root->AdoptChildren( nodetwo );
   
   nodeone->AdoptChildren( nodethree );

   Visitor::DebugVisitor debug_visitor( data );
   root->Accept( debug_visitor );

   /* only need to delete the root */
   delete( root );

   return( EXIT_SUCCESS );
}
