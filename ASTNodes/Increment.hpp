/**
 * Increment.hpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 10 06:43:37 2014
 */
#ifndef _INCREMENT_HPP_
#define _INCREMENT_HPP_  1
#include "Assignment.hpp"
namespace Node {
class Increment : public Assignment {
public:
   Increment();
   virtual ~Increment() = default;
};
}
#endif /* END _INCREMENT_HPP_ */
