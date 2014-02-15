/**
 * SymtabVisitor.hpp - 
 * @author: Jonathan Beard
 * @version: Fri May 24 08:00:53 2013
 */
#ifndef _SYMTABVISITOR_HPP_
#define _SYMTABVISITOR_HPP_  1

#include "DefaultVisitor.hpp"

#include <vector>
namespace Raft{
   class Data;
}

namespace Node{
   class NodeAbstract;
   class Declaration;
}

namespace Visitor{

class SymtabVisitor : public DefaultVisitor {
public:
   SymtabVisitor( Raft::Data &d );
   virtual ~SymtabVisitor();

   /**
    * Visit - (NodeAbstract), for debugging purposes
    * define more precise Visit methods as more 
    * nodes are created.  These visitors will simply
    * print the nodes at the appropriate levels
    * @param   node - Node::NodeAbstract*
    */
   virtual void Visit( Node::NodeAbstract *node );

   virtual void Visit( Node::Declaration  *node );

private:
   std::vector< std::string> temp_st;
};

} /* end namespace Visitor */

#endif /* END _SYMTABVISITOR_HPP_ */
