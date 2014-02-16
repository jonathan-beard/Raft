/**
 * Statement.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb 15 19:49:47 2014
 */
#ifndef _STATEMENT_HPP_
#define _STATEMENT_HPP_  1
#include "NodeAbstract.hpp"
#include <string>
namespace Node {
class Statement : public NodeAbstract {
public:
   Statement();
   virtual ~Statement() = default;
protected:
   Statement( const std::string name );
};
}
#endif /* END _STATEMENT_HPP_ */
