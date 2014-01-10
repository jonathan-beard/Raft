/**
 * ConstructorDeclaration.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 10 15:43:30 2014
 */
#ifndef _CONSTRUCTORDECLARATION_HPP_
#define _CONSTRUCTORDECLARATION_HPP_  1
#include "Declaration.hpp"
namespace Node {
class ConstructorDeclaration : public Declaration {
public:
   ConstructorDeclaration();
   virtual ~ConstructorDeclaration() = default;
};
}
#endif /* END _CONSTRUCTORDECLARATION_HPP_ */
