/**
 * MethodOverrides.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:24:19 2014
 */
#ifndef _METHODOVERRIDES_HPP_
#define _METHODOVERRIDES_HPP_  1
#include "MethodInherit.hpp"

namespace Node {
class MethodOverrides : public MethodInherit {
public:
   MethodOverrides();
   virtual ~MethodOverrides() = default;
};
}
#endif /* END _METHODOVERRIDES_HPP_ */
