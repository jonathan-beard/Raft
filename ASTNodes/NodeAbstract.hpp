/**
 * NodeAbstract.hpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 09:20:17 2013
 */
#ifndef _NODEABSTRACT_HPP_
#define _NODEABSTRACT_HPP_  1

#include <cstdint>
#include <typeinfo>
#include <set>
#include <string>

namespace Visitor{
   class DefaultVisitor;
}

namespace Raft{
   class Data;
}

namespace Node{
   
class NodeAbstract {
public:
   /**
    *  Default constructor 
    */
   NodeAbstract();
   /**
    * Copy constructor
    * @param   node - const NodeAbstract&
    */
   NodeAbstract( const NodeAbstract &node );
   /**
    * Default destructor, calls destructor
    * for children and all siblings then sets
    * parent to nullptr
    */
   virtual ~NodeAbstract();

   /**
    * MakeSibling - sets this node as a sibling
    * @param   sib - NodeAbstract ptr
    */
   void        MakeSibling( NodeAbstract *sib );
   /**
    * AdoptChildren - sets the node as child if no child is
    * already present.  If the calling node already has children
    * then the node is set as a sibling of this nodes children.
    * @param   node  - NodeAbstract*
    */
   void        AdoptChildren( NodeAbstract *node );
   /**
    * AbandonChildren - sets children to nullptr 
    */
   void                 AbandonChildren();
   /**
    * Orphan - gets rid of siblings and parents.
    */
   void                 Orphan();


   /**
    * get_first_sibling - returns the first sibling
    * as a constant reference, do not try to destroy
    * this reference or bad things could happy.
    * @return  NodeAbstract*
    */
   NodeAbstract&        get_first_sibling();
   bool                 has_sibling();
   /**
    *  Verious getter / setter methods to set the local
    *  instance variables with the name after get_ and
    *  set_.
    */
   void                 set_parent( NodeAbstract *parent );
   NodeAbstract&        get_parent();
   bool                 has_parent();

   std::set<NodeAbstract* >&  get_siblings();

   NodeAbstract&        get_child();
   bool                 has_child(); 

   int64_t              get_number();

   std::string&         get_name();
   void                 set_name( const std::string name );  

   /**
    * print - prints a representation fo this node as a 
    * string to the param stream.
    * @param   stream - std::ostream&
    * @return  std::ostream& - same as param stream
    */
   virtual std::ostream&   print( std::ostream &stream );
   
   /**
    * ToString - returns a string representation of this node
    * @return std::string
    */
   virtual std::string ToString();
   
   /**
    * GetType - returns the type of this object as
    * a type_info object.
    */
   const std::type_info&   GetType() const;
   
   /**
    * Accept - method calls the visit method of the visitor
    * from the calling node.  The visitor should have a 
    * proper visit method defined, else the default visitor
    * will be called.
    * @param   visitor - DefaultVisitor&
    */
   void                 Accept( Visitor::DefaultVisitor &visitor );

   /**
    * SetOrigin - takes a data object that is used to give each 
    * node the current line number where this node was reduced.
    * @param   d  - Raft::Data&
    */
   void  SetOrigin( Raft::Data &d );
   
   /**
    * invoke - invokes the visitor v on the root node passed in 
    * the parameter.  The visitor has the option of returning 
    * an entirely new tree or re-using the same one, if a new 
    * one is returned by the visitor the old one is assumed
    * to be discadable so the destructor is called on it. The
    * root param will be set to the current tree.
    * @param   visitor - DefaultVisitor&
    * @param   root    - NodeAbstract&
    */
   static   void  invoke( Visitor::DefaultVisitor &visitor, 
                          NodeAbstract &root );
    

protected:
   /* convenience constructor for sub-classes */
   NodeAbstract( const std::string name );
   std::string name;

private:
   static int64_t              number_of_nodes;
   int64_t                     node_number;
   NodeAbstract                *parent;
   NodeAbstract                *child;
   std::set<NodeAbstract* >    siblings;
   struct {
      std::string name;
      std::string line_text;
   }file_details;
};

} /* end namespace Node */

#endif /* END _NODEABSTRACT_HPP_ */
