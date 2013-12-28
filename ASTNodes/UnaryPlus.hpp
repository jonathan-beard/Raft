/**
 * UnaryPlus.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 13:40:03 2013
 */
#ifndef _UNARYPLUS_HPP_
#define _UNARYPLUS_HPP_  1
#include "Returns.hpp"
namespace Node{
class UnaryPlus : public Returns {
public:
   UnaryPlus();
   virtual ~UnaryPlus() = default;
};
} /* end namespace Node */
#endif /* END _UNARYPLUS_HPP_ */
