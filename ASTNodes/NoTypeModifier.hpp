/**
 * NoTypeModifier.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 24 09:11:10 2014
 */
#ifndef _NOTYPEMODIFIER_HPP_
#define _NOTYPEMODIFIER_HPP_  1
#include "TypeModifier.hpp"

namespace Node {
class NoTypeModifier : public TypeModifier {
public:
   NoTypeModifier();
   virtual ~NoTypeModifier() = default;
};
}
#endif /* END _NOTYPEMODIFIER_HPP_ */
