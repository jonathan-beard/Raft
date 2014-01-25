/**
 * Abstract.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan 25 06:06:30 2014
 */
#ifndef _ABSTRACT_HPP_
#define _ABSTRACT_HPP_  1

#include "InstantiationModifier.hpp"

namespace Node {
class Abstract : public InstantiationModifier {
public:
   Abstract();
   virtual ~Abstract() = default;
};
}
#endif /* END _ABSTRACT_HPP_ */
