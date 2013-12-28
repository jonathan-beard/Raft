/**
 * Nill.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 14:14:24 2013
 */
#ifndef _NILL_HPP_
#define _NILL_HPP_  1
#include "Returns.hpp"
namespace Node{
class Nill : public Returns {
public:
   Nill();
   virtual ~Nill() = default;
};
} /** end namespace Node **/
#endif /* END _NILL_HPP_ */
