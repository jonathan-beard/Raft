/**
 * OrOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _OROP_HPP_
#define _OROP_HPP_  1
#include "BitOperation.hpp"

namespace Node {
class OrOp : public BitOperation {
public:
   OrOp();
   virtual ~OrOp() = default;
};
}
#endif /* END _OROP_HPP_ */
