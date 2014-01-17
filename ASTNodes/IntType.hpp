/**
 * IntType.hpp - 
 * @author: Jonathan Beard
 * @version: Sun May 26 14:20:07 2013
 */
#ifndef _INTTYPE_HPP_
#define _INTTYPE_HPP_  1

#include <string>

#include "Type.hpp"

namespace Node {
class Initializer;

class IntType : public Type {
public:
   IntType();
   virtual ~IntType() = default; 

protected:

   IntType( const std::string name );
};

} /* end namespace Node */

#endif /* END _INTTYPE_HPP_ */
