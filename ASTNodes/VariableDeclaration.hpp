/**
 * VariableDeclaration.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan 23 13:56:33 2014
 */
#ifndef _VARIABLEDECLARATION_HPP_
#define _VARIABLEDECLARATION_HPP_  1
#include <string>
#include "Declaration.hpp"
namespace Node {
class VariableDeclaration : public Declaration {
public:
   VariableDeclaration( const std::string name );
   virtual ~VariableDeclaration() = default;
};
}
#endif /* END _VARIABLEDECLARATION_HPP_ */
