/**
 * WhileStatement.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb 15 09:23:35 2014
 */
#ifndef _WHILESTATEMENT_HPP_
#define _WHILESTATEMENT_HPP_  1
#include "Statement.hpp"
namespace Node {
class WhileStatement : public Statement {
public:
   WhileStatement();
   virtual ~WhileStatement() = default;
};
}
#endif /* END _WHILESTATEMENT_HPP_ */
