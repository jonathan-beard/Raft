/**
 * IfStatement.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb 15 09:23:35 2014
 */
#ifndef _IFSTATEMENT_HPP_
#define _IFSTATEMENT_HPP_  1
#include "Statement.hpp"

namespace Node {
class IfStatement : public Statement {
public:
   IfStatement();
   virtual ~IfStatement() = default;
};
}
#endif /* END _IFSTATEMENT_HPP_ */
