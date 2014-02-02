/**
 * DynamicArray.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  2 14:47:18 2014
 */
#ifndef _DYNAMICARRAY_HPP_
#define _DYNAMICARRAY_HPP_  1
#include "TypeModifier.hpp"
namespace Node {
class DynamicArray : public TypeModifier {
public:
   DynamicArray();
   virtual ~DynamicArray() = default;
};
}
#endif /* END _DYNAMICARRAY_HPP_ */
