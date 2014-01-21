/**
 * ClassImplements.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:24:19 2014
 */
#ifndef _CLASSIMPLEMENTS_HPP_
#define _CLASSIMPLEMENTS_HPP_  1
#include <string>
#include "ClassInherit.hpp"

namespace Node {
class ClassImplements : public ClassInherit {
public:
   ClassImplements(const std::string name );
   virtual ~ClassImplements() = default;
};
}
#endif /* END _CLASSIMPLEMENTS_HPP_ */
