/**
 * StreamPropertyList.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 09:41:19 2013
 */
#ifndef _STREAMPROPERTYLIST_HPP_
#define _STREAMPROPERTYLIST_HPP_  1
#include "NodeAbstract.hpp"

namespace Node{
class StreamPropertyList : public NodeAbstract {
public:
   StreamPropertyList();
   virtual ~StreamPropertyList() = default;
};
} /* end namespace Node */
#endif /* END _STREAMPROPERTYLIST_HPP_ */
