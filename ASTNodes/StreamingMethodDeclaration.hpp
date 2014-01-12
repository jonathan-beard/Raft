/**
 * StreamingMethodDeclaration.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 12 06:44:01 2014
 */
#ifndef _STREAMINGMETHODDECLARATION_HPP_
#define _STREAMINGMETHODDECLARATION_HPP_  1
#include "Declaration.hpp"
namespace Node {
class StreamingMethodDeclaration : public Declaration {
public:
   StreamingMethodDeclaration();
   virtual ~StreamingMethodDeclaration() = default; 
};
}
#endif /* END _STREAMINGMETHODDECLARATION_HPP_ */
