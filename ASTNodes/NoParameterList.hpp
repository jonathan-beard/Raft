/**
 * NoParameterList.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 15:51:14 2014
 */
#ifndef _NOPARAMETERLIST_HPP_
#define _NOPARAMETERLIST_HPP_  1
#include "ParameterList.hpp"

namespace Node {
class NoParameterList : public ParameterList {
public:
   NoParameterList();
   virtual ~NoParameterList() = default;
};
}
#endif /* END _NOPARAMETERLIST_HPP_ */
