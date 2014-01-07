/**
 * Constant.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Jan  7 12:52:01 2014
 */
#ifndef _CONSTANT_HPP_
#define _CONSTANT_HPP_  1
#include "StorageModifier.hpp"
namespace Node {
class Constant : public StorageModifier {
public:
   Constant();
   virtual ~Constant() = default;  
};
}
#endif /* END _CONSTANT_HPP_ */
