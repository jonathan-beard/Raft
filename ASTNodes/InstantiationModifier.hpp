/**
 * InstantiationModifier.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan 25 06:06:30 2014
 */
#ifndef _INSTANTIATIONMODIFIER_HPP_
#define _INSTANTIATIONMODIFIER_HPP_  1
#include <string>
#include "NodeAbstract.hpp"
namespace Node {
class InstantiationModifier : public NodeAbstract {
public:
   InstantiationModifier();
   virtual ~InstantiationModifier() = default;
protected:
   InstantiationModifier( const std::string name );
};
}
#endif /* END _INSTANTIATIONMODIFIER_HPP_ */
