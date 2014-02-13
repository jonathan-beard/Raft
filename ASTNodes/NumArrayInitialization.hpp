/**
 * NumArrayInitialization.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Feb 13 09:01:07 2014
 */
#ifndef _NUMARRAYINITIALIZATION_HPP_
#define _NUMARRAYINITIALIZATION_HPP_  1
#include "ArrayInitialization.hpp"
namespace Node {
class NumArrayInitialization : public ArrayInitialization {
public:
   NumArrayInitialization();
   virtual ~NumArrayInitialization() = default;
};
}
#endif /* END _NUMARRAYINITIALIZATION_HPP_ */
