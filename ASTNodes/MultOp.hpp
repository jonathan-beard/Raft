/**
 * MultOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _MULTOP_HPP_
#define _MULTOP_HPP_  1
#include "MathOp.hpp"
namespace Node {
class MultOp : public MathOp {
public:
   MultOp();
   virtual ~MultOp() = default;
};
}
#endif /* END _MULTOP_HPP_ */
