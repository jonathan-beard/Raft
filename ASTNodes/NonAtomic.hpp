/**
 * NonAtomic.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Jan  7 12:52:01 2014
 */
#ifndef _NONATOMIC_HPP_
#define _NONATOMIC_HPP_  1
#include "StorageModifier.hpp"
namespace Node {
class NonAtomic : public StorageModifier {
public:
   NonAtomic();
   virtual ~NonAtomic() = default;  
};
}
#endif /* END _NONATOMIC_HPP_ */
