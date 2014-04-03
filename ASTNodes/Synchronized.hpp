/**
 * Synchronized.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Apr  3 09:01:21 2014
 */
#ifndef _SYNCHRONIZED_HPP_
#define _SYNCHRONIZED_HPP_  1
#include "StorageModifier.hpp"

namespace Node{
class Synchronized : public StorageModifier {
public:
   Synchronized();
   virtual ~Synchronized() = default;
};
}
#endif /* END _SYNCHRONIZED_HPP_ */
