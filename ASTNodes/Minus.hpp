/**
 * Minus.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:39:23 2014
 */
#ifndef _MINUS_HPP_
#define _MINUS_HPP_  1
#include "MathOp.hpp"

namespace Node {
class Minus : public MathOp {
public:
   Minus();
   virtual ~Minus() = default;
};
}
#endif /* END _MINUS_HPP_ */
