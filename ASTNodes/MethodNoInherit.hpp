/**
 * MethodNoInherit.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:24:19 2014
 */
#ifndef _METHODNOINHERIT_HPP_
#define _METHODNOINHERIT_HPP_  1
#include "MethodInherit.hpp"
namespace Node {
class MethodNoInherit : public MethodInherit {
public:
   MethodNoInherit();
   virtual ~MethodNoInherit() = default;
};
}
#endif /* END _METHODNOINHERIT_HPP_ */
