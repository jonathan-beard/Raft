/**
 * Assignment.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb  8 17:29:36 2014
 */
#ifndef _ASSIGNMENT_HPP_
#define _ASSIGNMENT_HPP_  1
#include <string>
#include "NodeAbstract.hpp"
namespace Node {
class Assignment : public NodeAbstract {
public:
   Assignment();
   virtual ~Assignment() = default;
protected:
   Assignment( const std::string name );
};
}
#endif /* END _ASSIGNMENT_HPP_ */
