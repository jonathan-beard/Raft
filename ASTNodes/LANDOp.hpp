/**
 * LANDOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _LANDOP_HPP_
#define _LANDOP_HPP_  1
#include "CondOp.hpp"
namespace Node {
class LANDOp : public CondOp {
public:
   LANDOp();
   virtual ~LANDOp() = default;
};
}

#endif /* END _LANDOP_HPP_ */
