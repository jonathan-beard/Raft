/**
 * DebugVisitor.hpp - 
 * @author: Jonathan Beard
 * @version: Fri May 24 08:00:53 2013
 */
#ifndef _DEBUGVISITOR_HPP_
#define _DEBUGVISITOR_HPP_  1

#include "DefaultVisitor.hpp"

namespace Raft{
   class Data;
}

namespace Node{
   class NodeAbstract;
}

namespace Visitor{

class DebugVisitor : public DefaultVisitor {
public:
   DebugVisitor( Raft::Data &d );
   virtual ~DebugVisitor();
   
   static void DebugNodeAbstractVisit( Node::NodeAbstract &node, 
                                       Visitor::DefaultVisitor &visitor );
};

} /* end namespace Visitor */

#endif /* END _DEBUGVISITOR_HPP_ */
