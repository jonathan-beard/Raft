/**
 * Super.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 14:14:24 2013
 */
#ifndef _SUPER_HPP_
#define _SUPER_HPP_  1
#include "Returns.hpp"
namespace Node{
class Super : public Returns {
public:
   Super();
   virtual ~Super() = default;
};
} /** end namespace Node **/
#endif /* END _SUPER_HPP_ */
