/**
 * MathOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:39:23 2014
 */
#ifndef _MATHOP_HPP_
#define _MATHOP_HPP_  1
#include "Operation.hpp"
#include <string>

namespace Node {
class MathOp : public Operation {
public:
   MathOp();
   virtual ~MathOp() = default;
protected:
   MathOp( const std::string name );
};
}
#endif /* END _MATHOP_HPP_ */
