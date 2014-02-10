/**
 * Decrement.hpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 10 06:43:37 2014
 */
#ifndef _DECREMENT_HPP_
#define _DECREMENT_HPP_  1
#include "Assignment.hpp"

namespace Node {
class Decrement : public Assignment {
public:
   Decrement();
   virtual ~Decrement() = default;
};
}
#endif /* END _DECREMENT_HPP_ */
