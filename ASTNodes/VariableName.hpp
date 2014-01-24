/**
 * VariableName.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Dec 12 14:55:09 2013
 */
#ifndef _VARIABLENAME_HPP_
#define _VARIABLENAME_HPP_  1

#include "NodeAbstract.hpp"
#include <string>

namespace Node {

class VariableName : public NodeAbstract {
public:
   VariableName( const std::string &name );
   virtual ~VariableName() = default;
};

} /* end namespace Node */
#endif /* END _VARIABLENAME_HPP_ */
