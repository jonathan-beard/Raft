/**
 * ForStatement.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb 15 09:23:35 2014
 */
#ifndef _FORSTATEMENT_HPP_
#define _FORSTATEMENT_HPP_  1
#include "Statement.hpp"
namespace Node {
class ForStatement : public Statement {
public:
   ForStatement();
   virtual ~ForStatement() = default;
};
}
#endif /* END _FORSTATEMENT_HPP_ */
