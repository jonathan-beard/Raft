/**
 * function_map.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Mar  2 07:49:51 2014
 */
#ifndef _FUNCTION_MAP_HPP_
#define _FUNCTION_MAP_HPP_  1
#include <map>
#include <functional>

namespace Node{
   class NodeAbstract;
}

namespace Visitor{
   class DefaultVisitor;
}

typedef std::map< size_t, std::function< void( Node::NodeAbstract&, Visitor::DefaultVisitor&) > > FunctionMap;

#endif /* END _FUNCTION_MAP_HPP_ */
