/**
 * Reflect.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 18 10:31:09 2014
 */
#ifndef _REFLECT_HPP_
#define _REFLECT_HPP_  1
#include <typeinfo>
#include <cstdlib>
#include <functional>
#include <map>

namespace Node {
   class NodeAbstract;
}

typedef std::function< void (Node::NodeAbstract&) > Visit;

namespace Visitor {
class Reflect {
public:
   Reflect()          = default;
   virtual ~Reflect() = default;
   /**
    * GetFunctionFor - A bit of gymnasicts to get the correct
    * function for the visitor dynamically without too much pain
    * for the moment this means each node type will require an 
    * entry in the map, however this does mean that you can map
    * multiple "signatures" via typinfo.hash_code() to the same
    * function type as long as it is in fact a valid parameter
    * to the defined function
    * @param   node - Node::NodeAbstract&
    * @return  std::function< void (Node::NodeAbstract&>>* a.k.a. Visit
    */
   Visit* GetFunctionFor( Node::NodeAbstract &node );
protected:
   
   /** 
    * RegisterFunction - register functions here, a single function 
    * can be mapped to multiple hashes if you wish
    * @param   hash - return value from typeid.hash_code()
    * @param   v - Visit funciton to register
    */
   void RegisterFunction( size_t hash, Visit v );
private:
   std::map< size_t, Visit > function_map;
};
}
#endif /* END _REFLECT_HPP_ */
