/**
 * SizedArrayParameter.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan 23 12:01:22 2014
 */
#ifndef _SIZEDARRAYPARAMETER_HPP_
#define _SIZEDARRAYPARAMETER_HPP_  1
#include "Parameter.hpp"
namespace Node {
class SizedArrayParameter : public Parameter {
public:
   SizedArrayParameter();
   virtual ~SizedArrayParameter() = default;
};
}
#endif /* END _SIZEDARRAYPARAMETER_HPP_ */
