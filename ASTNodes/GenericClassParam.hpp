/**
 * GenericClassParam.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan  2 15:35:18 2014
 */
#ifndef _GENERICCLASSPARAM_HPP_
#define _GENERICCLASSPARAM_HPP_  1
#include "Generic.hpp"

namespace Node{
class GenericClassParam : public Generic {
public:
   GenericClassParam( const std::string name );
   virtual ~GenericClassParam() = default;
};
} /* end namespace Node */
#endif /* END _GENERICCLASSPARAM_HPP_ */
