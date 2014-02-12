/**
 * DivOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _DIVOP_HPP_
#define _DIVOP_HPP_  1
#include "MathOp.hpp"
namespace Node {
class DivOp : public MathOp {
public:
   DivOp();
   virtual ~DivOp() = default;
};
}
#endif /* END _DIVOP_HPP_ */
