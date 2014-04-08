/**
 * NoMethodModifier.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Apr  8 08:31:09 2014
 */
#ifndef _NOMETHODMODIFIER_HPP_
#define _NOMETHODMODIFIER_HPP_  1
#include "Modifier.hpp"

namespace Node{
class NoMethodModifier : public Modifier{
public:
   NoMethodModifier();
   virtual ~NoMethodModifier() = default;
};
}
#endif /* END _NOMETHODMODIFIER_HPP_ */
