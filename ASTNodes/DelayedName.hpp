/**
 * DelayedName.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 14:39:10 2013
 */
#ifndef _DELAYEDNAME_HPP_
#define _DELAYEDNAME_HPP_  1
#include "Returns.hpp"
namespace Node {
class DelayedName : public Returns {
public:
   DelayedName();
   virtual ~DelayedName() = default;
};
} /** end namespace Node **/
#endif /* END _DELAYEDNAME_HPP_ */
