/**
 * ArraySlice.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Feb 14 10:32:42 2014
 */
#ifndef _ARRAYSLICE_HPP_
#define _ARRAYSLICE_HPP_  1
#include "NodeAbstract.hpp"
#include <array>
#include <cstdint>
namespace Node {
class ArraySlice : public NodeAbstract {
public:
   ArraySlice( uint64_t a, uint64_t b );
   virtual ~ArraySlice() = default;
   std::array< uint64_t, 2 >
   get_range();
private:
   std::array< uint64_t, 2 > range; 
};
}
#endif /* END _ARRAYSLICE_HPP_ */
