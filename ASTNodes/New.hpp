/**
 * New.hpp - Node for new allocation, to be used with the keword free
 * @author: Jonathan Beard
 * @version: Sat Dec 28 12:59:03 2013
 */
#ifndef _NEW_HPP_
#define _NEW_HPP_  1
#include "Returns.hpp"

namespace Node{
class New : public Returns {
public:
   New();
   virtual ~New() = default;
};
} /** end namespace Node **/
#endif /* END _NEW_HPP_ */
