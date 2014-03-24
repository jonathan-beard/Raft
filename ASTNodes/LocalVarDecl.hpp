/**
 * LocalVarDecl.hpp - 
 * @author: Jonathan Beard
 * @version: Mon Mar 24 11:56:20 2014
 */
#ifndef _LOCALVARDECL_HPP_
#define _LOCALVARDECL_HPP_  1
#include "VarDeclFollows.hpp"
#include <string>

namespace Node {
class LocalVarDecl : public VarDeclFollows {
public:
   LocalVarDecl();
   virtual ~LocalVarDecl() = default;
};
}
#endif /* END _LOCALVARDECL_HPP_ */
