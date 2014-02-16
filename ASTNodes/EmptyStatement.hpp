/**
 * EmptyStatement.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Feb 14 21:11:48 2014
 */
#ifndef _EMPTYSTATEMENT_HPP_
#define _EMPTYSTATEMENT_HPP_  1
#include "Statement.hpp"
namespace Node {
class EmptyStatement : public Statement {
public:
   EmptyStatement();
   virtual ~EmptyStatement() = default;
};
}
#endif /* END _EMPTYSTATEMENT_HPP_ */
