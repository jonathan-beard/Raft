/**
 * ClassNoInherit.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:24:19 2014
 */
#ifndef _CLASSNOINHERIT_HPP_
#define _CLASSNOINHERIT_HPP_  1
#include "Inherit.hpp"

namespace Node {
class ClassNoInherit : public Inherit {
public:
   ClassNoLoader();
   virtual ~ClassNoLoader() = default;
};
}
#endif /* END _CLASSNOINHERIT_HPP_ */
