/**
 * SimpleParameter.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan 23 12:01:22 2014
 */
#ifndef _SIMPLEPARAMETER_HPP_
#define _SIMPLEPARAMETER_HPP_  1
#include "Parameter.hpp"
namespace Node {
class SimpleParameter : public Parameter {
public:
   SimpleParameter();
   virtual ~SimpleParameter() = default;
};
}
#endif /* END _SIMPLEPARAMETER_HPP_ */
