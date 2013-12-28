/**
 * UnaryMinus.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 13:40:03 2013
 */
#ifndef _UNARYMINUS_HPP_
#define _UNARYMINUS_HPP_  1

#include "Returns.hpp"
namespace Node{
class UnaryMinus : public Returns {
public:
   UnaryMinus();
   virtual ~UnaryMinus() = default;
};
} /* end namespace Node */
#endif /* END _UNARYMINUS_HPP_ */
