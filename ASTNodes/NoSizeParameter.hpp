/**
 * NoSizeParameter.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  2 15:46:03 2014
 */
#ifndef _NOSIZEPARAMETER_HPP_
#define _NOSIZEPARAMETER_HPP_  1
#include "Parameter.hpp"

namespace Node{
class NoSizeParameter : public Parameter {
public:
   NoSizeParameter();
   virtual ~NoSizeParameter() = default;
};
}
#endif /* END _NOSIZEPARAMETER_HPP_ */
