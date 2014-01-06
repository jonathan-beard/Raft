/**
 * PlaceholderParameter.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan  5 13:05:30 2014
 */
#ifndef _PLACEHOLDERPARAMETER_HPP_
#define _PLACEHOLDERPARAMETER_HPP_  1
#include "Parameter.hpp"
namespace Node{
class PlaceholderParameter : public Parameter {
public:
   PlaceholderParameter();
   virtual ~PlaceholderParameter() = default;
};
}
#endif /* END _PLACEHOLDERPARAMETER_HPP_ */
