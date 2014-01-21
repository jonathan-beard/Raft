/**
 * NoParameter.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Jan 21 10:23:21 2014
 */
#ifndef _NOPARAMETER_HPP_
#define _NOPARAMETER_HPP_  1
#include "Parameter.hpp"
namespace Node {
class NoParameter : public Parameter {
public:
   NoParameter();
   virtual ~NoParameter() = default;
};
}
#endif /* END _NOPARAMETER_HPP_ */
