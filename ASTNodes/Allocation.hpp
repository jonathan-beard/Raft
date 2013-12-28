/**
 * Allocation.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 12:55:09 2013
 */
#ifndef _ALLOCATION_HPP_
#define _ALLOCATION_HPP_  1
#include "Returns.hpp"
namespace Node{
class Allocation : public Returns {
public:
   Allocation();
   virtual ~Allocation() = default;
};
} /* end namespace Node */
#endif /* END _ALLOCATION_HPP_ */
