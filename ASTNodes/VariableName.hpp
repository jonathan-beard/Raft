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
   
   /**
    * get_ver_name - distinct form the parent method
    * get_name, the name of this node will still be
    * VariableName, but now we have a way to set the 
    * name of the var as well.
    * @return  std::string
    */
   std::string get_var_name();

private:

};

} /* end namespace Node */
#endif /* END _VARIABLENAME_HPP_ */
