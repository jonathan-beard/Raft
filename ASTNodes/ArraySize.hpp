/**
 * ArraySize.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  9 14:40:36 2014
 */
#ifndef _ARRAYSIZE_HPP_
#define _ARRAYSIZE_HPP_  1
#include "Value.tcc"

namespace Node {
class ArraySize : public Value< uint64_t > {
public:   
   ArraySize( uint64_t dimension );
   virtual ~ArraySize() = default;
};
}
#endif /* END _ARRAYSIZE_HPP_ */
