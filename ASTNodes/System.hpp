/**
 * System.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan 25 06:06:30 2014
 */
#ifndef _SYSTEM_HPP_
#define _SYSTEM_HPP_  1
#include "InstantiationModifier.hpp"

namespace Node {
class System : public InstantiationModifier {
public:
   System();
   virtual ~System()  = default;
};
}
#endif /* END _SYSTEM_HPP_ */
