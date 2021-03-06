/**
 * ClassNoInherit.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:24:19 2014
 */
#ifndef _CLASSNOINHERIT_HPP_
#define _CLASSNOINHERIT_HPP_  1
#include "ClassInherit.hpp"

namespace Node {
class ClassNoInherit : public ClassInherit {
public:
   ClassNoInherit();
   virtual ~ClassNoInherit() = default;
};
}
#endif /* END _CLASSNOINHERIT_HPP_ */
