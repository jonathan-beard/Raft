/**
 * EqualOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _EQUALOP_HPP_
#define _EQUALOP_HPP_  1
#include "CondOp.hpp"

namespace Node {
class EqualOp : public CondOp {
public:
   EqualOp();
   virtual ~EqualOp() = default;
};
}
#endif /* END _EQUALOP_HPP_ */
