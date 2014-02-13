/**
 * BoolArrayInitialization.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Feb 13 09:01:07 2014
 */
#ifndef _BOOLARRAYINITIALIZATION_HPP_
#define _BOOLARRAYINITIALIZATION_HPP_  1
#include "ArrayInitialization.hpp"

namespace Node {
class BoolArrayInitialization : public ArrayInitialization {
public:
   BoolArrayInitialization();
   virtual ~BoolArrayInitialization() = default;
};
}
#endif /* END _BOOLARRAYINITIALIZATION_HPP_ */
