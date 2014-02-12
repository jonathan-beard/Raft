/**
 * LessThanOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _LESSTHANOP_HPP_
#define _LESSTHANOP_HPP_  1
#include "CondOp.hpp"
namespace Node {
class LessThanOp : public CondOp {
public:
   LessThanOp();
   virtual ~LessThanOp() = default;
};
}
#endif /* END _LESSTHANOP_HPP_ */
