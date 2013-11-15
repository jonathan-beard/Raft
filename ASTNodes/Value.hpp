/**
 * Value.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Nov  7 07:35:26 2013
 */
#ifndef _VALUE_HPP_
#define _VALUE_HPP_  1
#include "NodeAbstract.hpp"

namespace Node {
class Value : public NodeAbstract {
public:
   Value( std::string value );
   virtual ~Value() = default;

   std::string get_value(); 
private:
   std::string value;
};

} /* end namespace Node */

#endif /* END _VALUE_HPP_ */
