/**
 * NoInherit.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan  3 16:19:03 2014
 */
#ifndef _NOINHERIT_HPP_
#define _NOINHERIT_HPP_  1
#include "Inherit.hpp"

namespace Node {
class NoInherit : public Inherit {
public:
   NoInherit();
   virtual ~NoInherit() = default;
};
} /** end namespace Node **/
#endif /* END _NOINHERIT_HPP_ */
