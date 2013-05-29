/**
 * StringType.hpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 20:56:40 2013
 */
#ifndef _STRINGTYPE_HPP_
#define _STRINGTYPE_HPP_  1

#include <string>
#include "Type.hpp"

namespace Node{

class Initializer;

class StringType{
public:
   StringType();
   virtual ~StringType();
   
   /* IsType - nothing special about this one, it'll
    * return true if value is a non null string.  The 
    * lexer should be able to tell if this is in fact
    * a string.
    * @param value - std::string ptr
    * @return bool   - true if value != nullptr
    */
   virtual bool IsType( std::string *value );

   virtual Initializer* GetDefaultInitializer();
};

} /* end namespace Node */

#endif /* END _STRINGTYPE_HPP_ */
