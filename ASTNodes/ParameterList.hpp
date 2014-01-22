/**
 * ParameterList.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 15:51:14 2014
 */
#ifndef _PARAMETERLIST_HPP_
#define _PARAMETERLIST_HPP_  1
#include <string>
#include "NodeAbstract.hpp"
namespace Node {
class ParameterList : public NodeAbstract {
public:
   ParameterList();
   virtual ~ParameterList() = default;
protected:
   ParameterList( const std::string name );
};
}
#endif /* END _PARAMETERLIST_HPP_ */
