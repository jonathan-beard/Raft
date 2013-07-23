/**
 * DefaultVisitor.hpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#ifndef _DEFAULTVISITOR_HPP_
#define _DEFAULTVISITOR_HPP_  1

#include <ostream>

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

   /* default visit, you must have at least this one */
   virtual void Visit( Node::NodeAbstract *node ) = 0;

   virtual void VisitChildren( Node::NodeAbstract *node );

   virtual void Error(std::string s);
protected:
   void increase_indent();
   void decrease_indent();
   std::string get_indent_level();
   
   Raft::Data  &data;
private:
   /* for prettier printing of nodes */
   static int64_t indent_level;
};

} /* end namespace visitor */
#endif /* END _DEFAULTVISITOR_HPP_ */
