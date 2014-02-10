/**
 * AssMinus.hpp - 
 * @author: Jonathan Beard
 * @version: Mon Feb 10 08:27:56 2014
 */
#ifndef _ASSMINUS_HPP_
#define _ASSMINUS_HPP_  1
#include "Assignment.hpp"
namespace Node {
class AssMinus : public Assignment {
public:
   AssMinus();
   virtual ~AssMinus() = default;
};
}
#endif /* END _ASSMINUS_HPP_ */
