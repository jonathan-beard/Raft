/**
 * ArrayParameter.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan 23 12:01:22 2014
 */
#ifndef _ARRAYPARAMETER_HPP_
#define _ARRAYPARAMETER_HPP_  1

#include "Parameter.hpp"
namespace Node {
class ArrayParameter : public Parameter {
public:
   ArrayParameter();
   virtual ~ArrayParameter() = default;
};
}
#endif /* END _ARRAYPARAMETER_HPP_ */
