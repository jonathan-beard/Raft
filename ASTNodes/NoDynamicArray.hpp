/**
 * NoDynamicArray.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  2 17:07:47 2014
 */
#ifndef _NODYNAMICARRAY_HPP_
#define _NODYNAMICARRAY_HPP_  1
#include "TypeModifier.hpp"

namespace Node {
class NoDynamicArray : public TypeModifier {
public:
   NoDynamicArray();
   virtual ~NoDynamicArray() = default;
};
}
#endif /* END _NODYNAMICARRAY_HPP_ */
