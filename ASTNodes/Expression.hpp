/**
 * Expression.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Feb 12 12:39:59 2014
 */
#ifndef _EXPRESSION_HPP_
#define _EXPRESSION_HPP_  1
#include "NodeAbstract.hpp"
#include <string>
namespace Node {
class Expression : public NodeAbstract {
public:
   Expression();
   virtual ~Expression() = default;
protected:
   Expression( const std::string name );
};
}
#endif /* END _EXPRESSION_HPP_ */
