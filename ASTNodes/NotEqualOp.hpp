/**
 * NotEqualOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _NOTEQUALOP_HPP_
#define _NOTEQUALOP_HPP_  1
#include "CondOp.hpp"
namespace Node {
class NotEqualOp : public CondOp {
public:
   NotEqualOp();
   virtual ~NotEqualOp() = default;
};
}
#endif /* END _NOTEQUALOP_HPP_ */
