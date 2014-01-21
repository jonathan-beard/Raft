/**
 * ClassExtends.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:24:19 2014
 */
#ifndef _CLASSEXTENDS_HPP_
#define _CLASSEXTENDS_HPP_  1
#include <string>
#include "ClassInherit.hpp"

namespace Node{
class ClassExtends : public ClassInherit {
public:
   ClassExtends( const std::string name );
   virtual ~ClassExtends() = default;
};
}
#endif /* END _CLASSEXTENDS_HPP_ */
