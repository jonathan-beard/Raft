/**
 * Implements.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan  3 16:13:05 2014
 */
#ifndef _IMPLEMENTS_HPP_
#define _IMPLEMENTS_HPP_  1
#include "Inherit.cpp"
namespace Node{
class Implements : public Inherit {
public:
   Implements();
   virtual ~Implements() = default;
};
} /** end namespace Node **/
#endif /* END _IMPLEMENTS_HPP_ */
