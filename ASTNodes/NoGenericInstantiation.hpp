/**
 * NoGenericInstantiation.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  2 17:07:26 2014
 */
#ifndef _NOGENERICINSTANTIATION_HPP_
#define _NOGENERICINSTANTIATION_HPP_  1
#include "GenericInstantiationList.hpp"
namespace Node {
class NoGenericInstantiation : public GenericInstantiationList {
public:
   NoGenericInstantiation();
   virtual ~NoGenericInstantiation() = default;
};
}
#endif /* END _NOGENERICINSTANTIATION_HPP_ */
