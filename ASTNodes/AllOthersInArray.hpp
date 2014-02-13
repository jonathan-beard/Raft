/**
 * AllOthersInArray.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Feb 13 09:12:25 2014
 */
#ifndef _ALLOTHERSINARRAY_HPP_
#define _ALLOTHERSINARRAY_HPP_  1
#include "Value.tcc"
namespace Node {
class AllOthersInArray : public Value< uint64_t > {
public:
   AllOthersInArray();
   virtual ~AllOthersInArray() = default;
};
}
#endif /* END _ALLOTHERSINARRAY_HPP_ */
