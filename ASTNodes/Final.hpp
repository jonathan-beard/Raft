/**
 * Final.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan 25 06:06:30 2014
 */
#ifndef _FINAL_HPP_
#define _FINAL_HPP_  1
#include "InstantiationModifier.hpp"
namespace Node {
class Final : public InstantiationModifier {
public:
   Final();
   virtual ~Final() = default;
};
}
#endif /* END _FINAL_HPP_ */
