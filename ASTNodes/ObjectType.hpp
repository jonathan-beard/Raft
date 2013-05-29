/**
 * ObjectType.hpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#ifndef _OBJECTTYPE_HPP_
#define _OBJECTTYPE_HPP_  1

#include "Type.hpp"

namespace Node{
class Initializer;

class ObjectType : public Type {
public:
   ObjectType();
   virtual ~ObjectType();

   /**
    * IsType - returns true if value != nullptr,
    * might define more behavior later, but this
    * seems like the only reasonable choice at the 
    * moment.
    * @param   value - std::string ptr
    * @return  bool - if value != nullptr
    */
   virtual bool IsType( std::string *value );
   
   virtual Initializer* GetDefaultInitializer();
};

} /* end namespace Node */
#endif /* END _OBJECTTYPE_HPP_ */
