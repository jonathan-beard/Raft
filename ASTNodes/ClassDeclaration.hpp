/**
 * ClassDeclaration.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan  1 17:00:38 2014
 */
#ifndef _CLASSDECLARATION_HPP_
#define _CLASSDECLARATION_HPP_  1
#include "NodeAbstract.hpp"
namespace Node{
class ClassDeclaration : public NodeAbstract {
public:
   ClassDeclaration( const std::string classname );
   virtual ~ClassDeclaration() = default;
};

} /* end namespace Node */
#endif /* END _CLASSDECLARATION_HPP_ */
