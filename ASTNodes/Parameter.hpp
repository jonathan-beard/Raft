/**
 * Parameter.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan  5 13:05:30 2014
 */
#ifndef _PARAMETER_HPP_
#define _PARAMETER_HPP_  1
#include <string>
#include "NodeAbstract.hpp"
namespace Node{
class Parameter : public NodeAbstract {
public:
   Parameter();
   virtual ~Parameter() = default;
protected:
   Parameter( const std::string name );
};
}
#endif /* END _PARAMETER_HPP_ */
