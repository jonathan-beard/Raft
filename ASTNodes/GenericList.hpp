/**
 * GenericList.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan  2 15:29:28 2014
 */
#ifndef _GENERICLIST_HPP_
#define _GENERICLIST_HPP_  1
#include "NodeAbstract.hpp"

namespace Node{
class GenericList : public NodeAbstract {
public:
   GenericList();
   virtual ~GenericList() = default;
};
} /** end namespace Node **/
#endif /* END _GENERICLIST_HPP_ */
