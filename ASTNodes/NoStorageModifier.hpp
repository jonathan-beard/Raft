/**
 * NoStorageModifier.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Apr  3 08:51:05 2014
 */
#ifndef _NOSTORAGEMODIFIER_HPP_
#define _NOSTORAGEMODIFIER_HPP_  1
#include "StorageModifier.hpp"

namespace Node{
class NoStorageModifier : public StorageModifier {
public:
   NoStorageModifier();
   virtual ~NoStorageModifier() = default;
};
}
#endif /* END _NOSTORAGEMODIFIER_HPP_ */
