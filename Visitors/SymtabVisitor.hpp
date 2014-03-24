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
   class VariableDeclaration;
   class FieldVarDecl;
}

namespace Visitor{

class SymtabVisitor : public DefaultVisitor {
public:
   SymtabVisitor( Raft::Data &d );
   virtual ~SymtabVisitor();

   static void AbstractVisit( Node::NodeAbstract &node, 
                              Visitor::DefaultVisitor &visitor );

   static void VarVisit( Node::NodeAbstract &node, 
                         Visitor::DefaultVisitor &visitor );
   
   friend void VarVisit( Node::NodeAbstract&, 
                         Visitor::DefaultVisitor&);
protected:
   std::vector< std::string> temp_st;
};

} /* end namespace Visitor */

#endif /* END _SYMTABVISITOR_HPP_ */
