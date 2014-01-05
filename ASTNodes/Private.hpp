/**
 * Private.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 14:06:39 2014
 */
#ifndef _PRIVATE_HPP_
#define _PRIVATE_HPP_  1
#include "Visibility.hpp"
namespace Node{
class Private : public Visibility {
public:
   Private();
   virtual ~Private() = default;
};
}
#endif /* END _PRIVATE_HPP_ */
