/**
 * EmptyTypeModifier.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 17 14:36:37 2014
 */
#ifndef _EMPTYTYPEMODIFIER_HPP_
#define _EMPTYTYPEMODIFIER_HPP_  1
#include "TypeModifier.hpp"

namespace Node {
class EmptyTypeModifier : public TypeModifier {
public:
   EmptyTypeModifier();
   virtual ~EmptyTypeModifier() = default;
};
}
#endif /* END _EMPTYTYPEMODIFIER_HPP_ */
