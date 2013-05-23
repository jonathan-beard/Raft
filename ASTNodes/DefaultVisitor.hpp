/**
 * DefaultVisitor.hpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#ifndef _DEFAULTVISITOR_HPP_
#define _DEFAULTVISITOR_HPP_  1

#include <ostream>

namespace Node{
   class NodeAbstract;
}

namespace Visitor{

class DefaultVisitor {
public:
   DefaultVisitor();
   DefaultVisitor( const DefaultVisitor &visitor );
   virtual ~DefaultVisitor();

protected:
   /* default visit, you must have at least this one */
   virtual void Visit( Node::NodeAbstract *node ) = 0;

   virtual void VisitChildren( Node::NodeAbstract *node );

   virtual void Error(std::string s);
private:
   std::ostream &errstream;
};

} /* end namespace visitor */
#endif /* END _DEFAULTVISITOR_HPP_ */
