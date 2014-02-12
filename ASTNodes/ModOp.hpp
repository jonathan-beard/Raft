/**
 * ModOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _MODOP_HPP_
#define _MODOP_HPP_  1
#include "MathOp.hpp"

namespace Node {
class ModOp : public MathOp {
public:
   ModOp();
   virtual ~ModOp() = default;
};
}
#endif /* END _MODOP_HPP_ */
