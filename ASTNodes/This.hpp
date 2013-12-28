/**
 * This.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 14:14:24 2013
 */
#ifndef _THIS_HPP_
#define _THIS_HPP_  1
#include "Returns.hpp"
namespace Node{
class This : public Returns {
public:
   This();
   virtual ~This() = default;
};
} /** end namespace Node **/
#endif /* END _THIS_HPP_ */
