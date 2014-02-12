/**
 * LeftShiftOp.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Feb 12 06:02:36 2014
 */
#ifndef _LEFTSHIFTOP_HPP_
#define _LEFTSHIFTOP_HPP_  1
#include "BitOperation.hpp"

namespace Node {
class LeftShiftOp : public BitOperation {
public:
   LeftShiftOp();
   virtual ~LeftShiftOp() = default;
};
}
#endif /* END _LEFTSHIFTOP_HPP_ */
