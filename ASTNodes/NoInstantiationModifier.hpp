/**
 * NoInstantiationModifier.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan 25 06:06:30 2014
 */
#ifndef _NOINSTANTIATIONMODIFIER_HPP_
#define _NOINSTANTIATIONMODIFIER_HPP_  1
#include "InstantiationModifier.hpp"

namespace Node {
class NoInstantiationModifier : public InstantiationModifier {
public:
   NoInstantiationModifier();
   virtual ~NoInstantiationModifier() = default;
};
}
#endif /* END _NOINSTANTIATIONMODIFIER_HPP_ */
