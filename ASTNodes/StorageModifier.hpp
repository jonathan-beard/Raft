/**
 * StorageModifier.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Jan  7 12:49:04 2014
 */
#ifndef _STORAGEMODIFIER_HPP_
#define _STORAGEMODIFIER_HPP_  1
#include <string>
#include "Modifier.hpp"
namespace Node{
class StorageModifier : public Modifier {
public:
   StorageModifier();
   virtual ~StorageModifier() = default;
protected:
   StorageModifier( const std::string name );
};
}
#endif /* END _STORAGEMODIFIER_HPP_ */
