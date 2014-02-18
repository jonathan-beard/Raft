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

namespace Visitor {
class Reflect {
public:
   Reflect()          = default;
   virtual ~Reflect() = default;
protected:
   typedef std::function< void (Node::NodeAbstract&) > Visit;
   
   void RegisterFunction( size_t hash, Visit v );
   Visit* GetFunction( size_t hash );
private:
   std::map< size_t, Visit > function_map;
};
}
#endif /* END _REFLECT_HPP_ */
