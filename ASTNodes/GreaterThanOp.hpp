/**
 * GreaterThanOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _GREATERTHANOP_HPP_
#define _GREATERTHANOP_HPP_  1
#include "CondOp.hpp"

namespace Node {
class GreaterThanOp : public CondOp {
public:
   GreaterThanOp();
   virtual ~GreaterThanOp() = default;
};
}
#endif /* END _GREATERTHANOP_HPP_ */
