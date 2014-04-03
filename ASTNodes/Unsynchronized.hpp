/**
 * Unsynchronized.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Apr  3 09:01:21 2014
 */
#ifndef _UNSYNCHRONIZED_HPP_
#define _UNSYNCHRONIZED_HPP_  1
#include "StorageModifier.hpp"

namespace Node {
class Unsynchronized : public StorageModifier {
public:
   Unsynchronized();
   virtual ~Unsynchronized() = default;
};
}
#endif /* END _UNSYNCHRONIZED_HPP_ */
