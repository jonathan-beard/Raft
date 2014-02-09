/**
 * GenericInstantiation.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  9 14:22:46 2014
 */
#ifndef _GENERICINSTANTIATION_HPP_
#define _GENERICINSTANTIATION_HPP_  1
#include "Declaration.hpp"
namespace Node {
class GenericInstantiation : public Declaration {
public:
   GenericInstantiation();
   virtual ~GenericInstantiation() = default; 
};
}
#endif /* END _GENERICINSTANTIATION_HPP_ */
