/**
 * VoidType.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Nov 14 15:40:43 2013
 */
#ifndef _VOIDTYPE_HPP_
#define _VOIDTYPE_HPP_  1

#include "Type.hpp"

namespace Node {

class VoidType : public Type {
public:
   /**
    * there's not really much to do here since we just
    * need a placeholder node to indicate a void return
    */
   VoidType();
   virtual ~VoidType() = default;
};

} /* end namespace Node */

#endif /* END _VOIDTYPE_HPP_ */
