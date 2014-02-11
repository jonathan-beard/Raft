/**
 * Plus.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:39:23 2014
 */
#ifndef _PLUS_HPP_
#define _PLUS_HPP_  1
#include "MathOp.hpp"

namespace Node {
class Plus : public MathOp {
public:
   Plus();
   virtual ~Plus() = default;
};
}
#endif /* END _PLUS_HPP_ */
