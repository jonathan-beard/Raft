/**
 * CondOp.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#ifndef _CONDOP_HPP_
#define _CONDOP_HPP_  1
#include "Operation.hpp"
#include <string>

namespace Node {
class CondOp : public Operation {
public:
   CondOp();
   virtual ~CondOp() = default;
protected:
   CondOp( const std::string name );
};
}
#endif /* END _CONDOP_HPP_ */
