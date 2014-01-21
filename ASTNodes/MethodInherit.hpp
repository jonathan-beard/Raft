/**
 * MethodInherit.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:17:45 2014
 */
#ifndef _METHODINHERIT_HPP_
#define _METHODINHERIT_HPP_  1
#include <string>
#include "Inherit.hpp"
namespace Node {
class MethodInherit : public Inherit {
public:
   MethodInherit();
   virtual ~MethodInherit() = default;
protected:
   MethodInherit( const std::string name );
};
}
#endif /* END _METHODINHERIT_HPP_ */
