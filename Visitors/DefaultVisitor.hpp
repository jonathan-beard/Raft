/**
 * DefaultVisitor.hpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#ifndef _DEFAULTVISITOR_HPP_
#define _DEFAULTVISITOR_HPP_  1

#include <ostream>
#include "ClassTree.hpp"
#include "function_map.hpp"

namespace Raft{
   class Data;
}

namespace Node{
   class NodeAbstract;
}

namespace Visitor{

class DefaultVisitor {
public:
   DefaultVisitor( Raft::Data &d );
   DefaultVisitor( const DefaultVisitor &visitor );
   virtual ~DefaultVisitor();

   static void DefaultNodeAbstractVisit( Node::NodeAbstract &node );


   /**
    * Visit - Calls the correct visitor metohd for the node passed
    * as a param according to the methods available and the class
    * tree param.
    * @param   node - Node::NodeAbstract&
    * @param   tree - ClassTree&
    */
   virtual void Visit( Node::NodeAbstract &node, ClassTree &tree );

   /**
    * VisitChildren - Calls visit on all the children of 
    * the node param.
    * @param   node - Node::NodeAbstract&
    */
   virtual void VisitChildren( Node::NodeAbstract &node );

   virtual void Error(std::string s);
protected:
   void increase_indent();
   void decrease_indent();
   std::string get_indent_level();
   
   Raft::Data  &data;
   FunctionMap visit_methods;
private:
   /* for prettier printing of nodes */
   static int64_t indent_level;
};

} /* end namespace visitor */
#endif /* END _DEFAULTVISITOR_HPP_ */
