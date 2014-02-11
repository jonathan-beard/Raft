/**
 * Operation.hpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 10 08:33:48 2014
 */
#ifndef _OPERATION_HPP_
#define _OPERATION_HPP_  1
#include "NodeAbstract.hpp"
#include <string>
namespace Node{
class Operation : public NodeAbstract {
public:
   Operation();
   virtual ~Operation() = default;
protected:
   Operation( const std::string name );
};
}
#endif /* END _OPERATION_HPP_ */
