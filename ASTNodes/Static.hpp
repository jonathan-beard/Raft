/**
 * Static.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Jan  7 12:52:01 2014
 */
#ifndef _STATIC_HPP_
#define _STATIC_HPP_  1
#include "StorageModifier.hpp"
namespace Node {
class Static : public StorageModifier {
public:
   Static();
   virtual ~Static() = default;  
};
}
#endif /* END _STATIC_HPP_ */
