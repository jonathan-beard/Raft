/**
 * Tilde.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 12:41:45 2013
 */
#ifndef _TILDE_HPP_
#define _TILDE_HPP_  1

#include "Returns.hpp"
namespace Node{
class Tilde : public Returns {
public:
   Tilde();
   virtual ~Tilde() = default;
}; 
} /* end namespace Node */

#endif /* END _TILDE_HPP_ */
