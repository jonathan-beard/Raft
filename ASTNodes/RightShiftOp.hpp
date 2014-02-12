/**
 * RightShiftOp.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Feb 12 06:02:36 2014
 */
#ifndef _RIGHTSHIFTOP_HPP_
#define _RIGHTSHIFTOP_HPP_  1
#include "BitOperation.hpp"
namespace Node {
class RightShiftOp : public BitOperation {
public:
   RightShiftOp();
   virtual ~RightShiftOp() = default;
};
}
#endif /* END _RIGHTSHIFTOP_HPP_ */
