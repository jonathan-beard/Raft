/**
 * NoArgumentList.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 24 09:40:46 2014
 */
#ifndef _NOARGUMENTLIST_HPP_
#define _NOARGUMENTLIST_HPP_  1
#include "ArgumentList.hpp"

namespace Node{
class NoArgumentList : public ArgumentList {
public:
   NoArgumentList();
   virtual ~NoArgumentList() = default;
}
}
#endif /* END _NOARGUMENTLIST_HPP_ */
