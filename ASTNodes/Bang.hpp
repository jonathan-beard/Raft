/**
 * Bang.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 12:41:45 2013
 */
#ifndef _BANG_HPP_
#define _BANG_HPP_  1

#include "Returns.hpp"
namespace Node{
class Bang : public Returns {
public:
   Bang();
   virtual ~Bang() = default;
}; 
} /* end namespace Node */

#endif /* END _BANG_HPP_ */
