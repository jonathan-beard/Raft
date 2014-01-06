/**
 * ArrayAccess.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 15:35:23 2014
 */
#ifndef _ARRAYACCESS_HPP_
#define _ARRAYACCESS_HPP_  1
#include "Access.hpp"
namespace Node{
class ArrayAccess : public Access {
public:
   ArrayAccess();
   virtual ~ArrayAccess() = default;
};
} /** end namespace Node **/
#endif /* END _ARRAYACCESS_HPP_ */
