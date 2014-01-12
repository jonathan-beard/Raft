/**
 * ClassDeclaration.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan  1 17:00:38 2014
 */
#ifndef _CLASSDECLARATION_HPP_
#define _CLASSDECLARATION_HPP_  1
#include "Declaration.hpp"
namespace Node{
class ClassDeclaration : public Declaration {
public:
   ClassDeclaration( const std::string classname );
   virtual ~ClassDeclaration() = default;
};

} /* end namespace Node */
#endif /* END _CLASSDECLARATION_HPP_ */
