/**
 * DebugVisitor.hpp - 
 * @author: Jonathan Beard
 * @version: Fri May 24 08:00:53 2013
 */
#ifndef _DEBUGVISITOR_HPP_
#define _DEBUGVISITOR_HPP_  1

#include "DefaultVisitor.hpp"

namespace AP{
   class AP_Data;
}

namespace Node{
   class NodeAbstract;
}

namespace Visitor{

class DebugVisitor : public DefaultVisitor {
public:
   DebugVisitor( AP::AP_Data &d );
   virtual ~DebugVisitor();

   /**
    * Visit - (NodeAbstract), for debugging purposes
    * define more precise Visit methods as more 
    * nodes are created.  These visitors will simply
    * print the nodes at the appropriate levels
    * @param   node - Node::NodeAbstract*
    */
   virtual void Visit( Node::NodeAbstract *node );
};

} /* end namespace Visitor */

#endif /* END _DEBUGVISITOR_HPP_ */
