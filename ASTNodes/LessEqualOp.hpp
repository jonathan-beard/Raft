/**
 * LessEqualOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _LESSEQUALOP_HPP_
#define _LESSEQUALOP_HPP_  1
#include "CondOp.hpp"

namespace Node {
class LessEqualOp : public CondOp {
public:
   LessEqualOp();
   virtual ~LessEqualOp() = default;
};
}
#endif /* END _LESSEQUALOP_HPP_ */
