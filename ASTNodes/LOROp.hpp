/**
 * LOROp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _LOROP_HPP_
#define _LOROP_HPP_  1
#include "CondOp.hpp"

namespace Node {
class LOROp : public CondOp {
public:
   LOROp();
   virtual ~LOROp() = default;
};
}
#endif /* END _LOROP_HPP_ */
