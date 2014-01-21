/**
 * MethodDeclaration.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 15 10:56:35 2014
 */
#ifndef _METHODDECLARATION_HPP_
#define _METHODDECLARATION_HPP_  1
#include <string>
#include "Declaration.hpp"

namespace Node {
class MethodDeclaration : public Declaration {
public:
   MethodDeclaration( const std::string name );
   virtual ~MethodDeclaration() = default;
};
}
#endif /* END _METHODDECLARATION_HPP_ */
