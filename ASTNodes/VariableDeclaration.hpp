/**
 * VariableDeclaration.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan 23 13:56:33 2014
 */
#ifndef _VARIABLEDECLARATION_HPP_
#define _VARIABLEDECLARATION_HPP_  1
#include "Declaration.hpp"
namespace Node {
class VariableDeclaration : public Declaration {
public:
   VariableDeclaration();
   virtual ~VariableDeclaration() = default;
};
}
#endif /* END _VARIABLEDECLARATION_HPP_ */
