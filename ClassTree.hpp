#ifndef _CLASSTREE_HPP_
#define _CLASSTREE_HPP_ 1
#include <ostream>
#include <map>
#include "function_map.hpp"

class ClassTree {
public:   
   ClassTree() = default;
   virtual ~ClassTree();


   /**
    * addRelation - adds a class relationship to this tree. If the 
    * base class hasn't been added yet, a node will be added for it.
    * When adding a class that has no parent class, simply use zero
    * for the base hash_code().
    * @param   base - const size_t base hash_code()
    * @param   derived - const size_t derived hash_code()
    */
   void     addRelation(   const size_t base, const size_t derived );
   /**
    * getClosestTo - given the derived class "class_type" find the closes
    * function call in "funciton_classes" that matches "class_type", if
    * no matching base class is found, zero is returned.
    * @param   class_type - const size_t
    * @param   function_map - FunctionMap& with functions to match
    * @return  size_t, closest match out of function_map
    */
   size_t   getClosestTo(  const size_t class_type, 
                           FunctionMap  &function_map );

   std::ostream& printTree( std::ostream &stream );

private:
   struct Node {
      Node( size_t key );
      Node( size_t key , Node *parent );
      virtual ~Node() = default;

      Node     *parent;

      size_t   key;
   };

   std::map< size_t, Node* > tree;
};
#endif
