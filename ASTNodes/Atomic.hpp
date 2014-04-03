/**
 * Atomic.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Apr  3 09:01:21 2014
 */
#ifndef _ATOMIC_HPP_
#define _ATOMIC_HPP_  1
#include "StorageModifier.hpp"

namespace Node{
class Atomic : public StorageModifier {
public:
   Atomic();
   virtual ~Atomic() = default;
};
}
#endif /* END _ATOMIC_HPP_ */
