/**
 * Extends.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan  3 16:13:05 2014
 */
#ifndef _EXTENDS_HPP_
#define _EXTENDS_HPP_  1
#include "Inherit.cpp"
namespace Node{
class Extends : public Inherit {
public:
   Extends();
   virtual ~Extends() = default;
};
} /** end namespace Node **/
#endif /* END _EXTENDS_HPP_ */
