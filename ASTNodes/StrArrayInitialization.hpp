/**
 * StrArrayInitialization.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Feb 13 09:01:07 2014
 */
#ifndef _STRARRAYINITIALIZATION_HPP_
#define _STRARRAYINITIALIZATION_HPP_  1
#include "ArrayInitialization.hpp"

namespace Node {
class StrArrayInitialization : public ArrayInitialization {
public:
   StrArrayInitialization();
   virtual ~StrArrayInitialization() = default;
};
}
#endif /* END _STRARRAYINITIALIZATION_HPP_ */
