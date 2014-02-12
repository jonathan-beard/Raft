/**
 * GreaterEqualOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _GREATEREQUALOP_HPP_
#define _GREATEREQUALOP_HPP_  1
#include "CondOp.hpp"

namespace Node{
class GreaterEqualOp : public CondOp {
public:
   GreaterEqualOp();
   virtual ~GreaterEqualOp() = default;
};
}
#endif /* END _GREATEREQUALOP_HPP_ */
