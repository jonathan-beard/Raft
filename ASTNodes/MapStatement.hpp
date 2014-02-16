/**
 * MapStatement.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb 15 09:23:35 2014
 */
#ifndef _MAPSTATEMENT_HPP_
#define _MAPSTATEMENT_HPP_  1
#include "Statement.hpp"

namespace Node {
class MapStatement : public Statement {
public:
   MapStatement();
   virtual ~MapStatement() = default;
};
}
#endif /* END _MAPSTATEMENT_HPP_ */
