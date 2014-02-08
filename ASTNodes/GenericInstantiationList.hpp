/**
 * GenericInstantiationList.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Feb  2 17:07:26 2014
 */
#ifndef _GENERICINSTANTIATIONLIST_HPP_
#define _GENERICINSTANTIATIONLIST_HPP_  1
#include <string>
#include "NodeAbstract.hpp"

namespace Node{
class GenericInstantiationList : public NodeAbstract {
public:
   GenericInstantiationList();
   virtual ~GenericInstantiationList() = default;
protected:
   GenericInstantiationList( const std::string name );
};
}
#endif /* END _GENERICINSTANTIATIONLIST_HPP_ */
