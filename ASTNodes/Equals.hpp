/**
 * Equals.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Feb  8 17:29:36 2014
 */
#ifndef _EQUALS_HPP_
#define _EQUALS_HPP_  1
#include "Assignment.hpp"

namespace Node{
class Equals : public Assignment {
public:
   Equals();
   virtual ~Equals() = default; 
};
}
#endif /* END _EQUALS_HPP_ */
