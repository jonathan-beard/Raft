/**
 * FieldVarDecl.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan  5 14:39:16 2014
 */
#ifndef _FIELDVARDECL_HPP_
#define _FIELDVARDECL_HPP_  1
#include "VarDeclFollows.hpp"
namespace Node{
class FieldVarDecl : public VarDeclFollows {
public:
   FieldVarDecl();
   virtual ~FieldVarDecl() = default;
};
} 
#endif /* END _FIELDVARDECL_HPP_ */
