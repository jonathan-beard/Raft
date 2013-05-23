/**
 * NodeAbstract.hpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 09:20:17 2013
 */
#ifndef _NODEABSTRACT_HPP_
#define _NODEABSTRACT_HPP_  1

#include <cstdint>
#include <vector>
#include "Type.hpp"



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
   NodeAbstract*        get_first_sibling();

   /**
    *  Verious getter / setter methods to set the local
    *  instance variables with the name after get_ and
    *  set_.
    */
   void                 set_parent( NodeAbstract *parent );
   NodeAbstract*        get_parent();

   std::vector<NodeAbstract* >&  get_siblings();

   NodeAbstract*        get_child();
   const Type&          get_type();
   void                 set_type( const Type *type );

   int64_t              get_number();

   const std::string&   get_name();
   void                 set_name( std::string name );
   void                 set_name( const std::string &name ); 
   
   /**
    * Accept - method calls the visit method of the visitor
    * from the calling node.  The visitor should have a 
    * proper visit method defined, else the default visitor
    * will be called.
    * @param   visitor - DefaultVisitor&
    */
   void                 Accept( DefaultVisitor &visitor );

   /**
    * invoke - invokes the visitor v on the root node passed in 
    * the parameter.  The visitor has the option of returning 
    * an entirely new tree or re-using the same one, if a new 
    * one is returned by the visitor the old one is assumed
    * to be discadable so the destructor is called on it. The
    * root param will be set to the current tree.
    * @param   visitor - DefaultVisitor&
    * @param   root    - NodeAbstract*
    */
   static   void  invoke( DefaultVisitor &visitor, 
                          NodeAbstract *root );
    

private:
   static int64_t              number_of_nodes;
   int64_t                     node_number;
   NodeAbstract                *parent;
   NodeAbstract                *child;
   std::vector<NodeAbstract* > siblings;
   Type                        type;
   std::string                 name;
};

} /* end namespace Node */

#endif /* END _NODEABSTRACT_HPP_ */
