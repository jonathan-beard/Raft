/**
 * TypeCastExpression.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Feb 12 07:18:09 2014
 */
#ifndef _TYPECASTEXPRESSION_HPP_
#define _TYPECASTEXPRESSION_HPP_  1
#include "CastExpression.hpp"

namespace Node {
class TypeCastExpression : public CastExpression {
public:
   TypeCastExpression();
   virtual ~TypeCastExpression() = default;
};
}
#endif /* END _TYPECASTEXPRESSION_HPP_ */
