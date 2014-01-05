/**
 * Protected.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 14:06:39 2014
 */
#ifndef _PROTECTED_HPP_
#define _PROTECTED_HPP_  1
#include "Visibility.hpp"
namespace Node{
class Protected : public Visibility {
public:
   Protected();
   virtual ~Protected() = default;
};
}
#endif /* END _PROTECTED_HPP_ */
