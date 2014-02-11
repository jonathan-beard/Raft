/**
 * AndOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _ANDOP_HPP_
#define _ANDOP_HPP_  1
#include "BitOperation.hpp"

namespace Node{
class AndOp : public BitOperation {
public:
   AndOp();
   virtual ~AndOp() = default;
};
}
#endif /* END _ANDOP_HPP_ */
