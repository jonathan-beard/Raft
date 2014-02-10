/**
 * AssPlus.hpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 10 08:27:56 2014
 */
#ifndef _ASSPLUS_HPP_
#define _ASSPLUS_HPP_  1
#include "Assignment.hpp"

namespace Node {
class AssPlus : public Assignment {
public:
   AssPlus();
   virtual ~AssPlus() = default;
};
}
#endif /* END _ASSPLUS_HPP_ */
