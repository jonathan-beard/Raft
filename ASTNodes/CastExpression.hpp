/**
 * CastExpression.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan 25 07:25:06 2014
 */
#ifndef _CASTEXPRESSION_HPP_
#define _CASTEXPRESSION_HPP_  1
#include "Expression.hpp"

namespace Node{
class CastExpression : public Expression {
public:
   CastExpression();
   virtual ~CastExpression() = default;
protected:
   CastExpression( const std::string name );
};
}
#endif /* END _CASTEXPRESSION_HPP_ */
