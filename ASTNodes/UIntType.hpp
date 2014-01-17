/**
 * UIntType.hpp - 
 * @author: Jonathan Beard
 * @version: Mon May 27 14:03:20 2013
 */
#ifndef _UINTTYPE_HPP_
#define _UINTTYPE_HPP_  1

#include <string>
#include "Type.hpp"

namespace Node{
class Initializer;

class UIntType : public Type {
public:
   UIntType();
   virtual ~UIntType() = default;
protected:
   UIntType( const std::string name );
};

} /* end namespace Node */

#endif /* END _UINTTYPE_HPP_ */
