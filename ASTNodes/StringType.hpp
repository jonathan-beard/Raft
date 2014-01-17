/**
 * StringType.hpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#ifndef _STRINGTYPE_HPP_
#define _STRINGTYPE_HPP_  1

#include <string>
#include "Type.hpp"

namespace Node{

class Initializer;

class StringType : public Type{
public:
   StringType();
   virtual ~StringType() = default;
};

} /* end namespace Node */

#endif /* END _STRINGTYPE_HPP_ */
