/**
 * DefaultVisitor.hpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#ifndef _DEFAULTVISITOR_HPP_
#define _DEFAULTVISITOR_HPP_  1

#include <ostream>

namespace AP{
   class AP_Data;
}

namespace Node{
   class NodeAbstract;
}

namespace Visitor{

class DefaultVisitor {
public:
   DefaultVisitor( AP::AP_Data &d );
   DefaultVisitor( const DefaultVisitor &visitor );
   virtual ~DefaultVisitor();

   /* default visit, you must have at least this one */
   virtual void Visit( Node::NodeAbstract *node ) = 0;

   virtual void VisitChildren( Node::NodeAbstract *node );

   virtual void Error(std::string s);
protected:
   AP::AP_Data  &data;
};

} /* end namespace visitor */
#endif /* END _DEFAULTVISITOR_HPP_ */
