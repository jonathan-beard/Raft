/**
 * ClassInherit.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:17:45 2014
 */
#ifndef _CLASSINHERIT_HPP_
#define _CLASSINHERIT_HPP_  1
#include <string>
#include "Inherit.hpp"

namespace Node {
class ClassInherit : public Inherit {
public:
   ClassInherit();
   virtual ~ClassInherit() = default;
protected:
   ClassInherit( const std::string name );
};
}
#endif /* END _CLASSINHERIT_HPP_ */
