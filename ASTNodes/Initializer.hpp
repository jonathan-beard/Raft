/**
 * Initializer.hpp - 
 * @author: Jonathan Beard
 * @version: Wed May 29 15:12:21 2013
 */
#ifndef _INITIALIZER_HPP_
#define _INITIALIZER_HPP_  1

#include <cstdint>
#include <cinttypes>
#include <cfloat>
#include <exception>
#include "NodeAbstract.hpp"

namespace Node{
/*
class ConversionException : public exception
{
public:
   ConversionException( std::string type, 
                        std::string value ) : T( type ),
                                              V( value )
   {}

std::ostream& print( std::ostream &stream )
   {
      stream << "Error converting \"" << V << "\" to " <<
         "\"" << T << "\"";
   }
private:
   std::string T;
   std::string V;

} ConvException;
*/
class Initializer : public NodeAbstract{
public:
   Initializer( std::string v );
   Initializer( intmax_t    v );
   Initializer( uintmax_t   v );
   Initializer( bool        v );

   virtual ~Initializer();

   bool        IsString();
   bool        IsInt();
   bool        IsUInt();
   bool        IsBool();

   /**
    * GetValueString - returns this initializer object's
    * value as a std::string
    * @return std::string
    */
   std::string GetValueString();
   /**
    * GetValueInt - returns this initializer object's
    * value as a intmax_t
    * @return intmax_t
    */
   intmax_t    GetValueInt();
   /**
    * GetValueUInt - returns this initializer object's
    * value as a uintmax_t
    * @return  uintmax_t
    */
   uintmax_t   GetValueUInt();
   /**
    * GetValueBool - returns this initializer object's
    * value as a bool
    * @return bool
    */
   bool        GetValueBool();


   /** 
    * AcceptNewValue - use these functions to apply a 
    * new value to this initializer object, will only
    * accept the proper types and ranges for the type
    * constructed.  If an improper value is supplied
    * as a parameter then a false boolean value will 
    * be returned.  Once this function is called and 
    * true is returned, the correct converted (if
    * necessary) value is accessible via GetValueXXX()
    * @param - value - std::string&
    * @return  bool  - true if useable value
    */
   bool        AcceptNewValue( std::string &value );
   /** 
    * AcceptNewValue - use these functions to apply a 
    * new value to this initializer object, will only
    * accept the proper types and ranges for the type
    * constructed.  If an improper value is supplied
    * as a parameter then a false boolean value will 
    * be returned.  Once this function is called and 
    * true is returned, the correct converted (if
    * necessary) value is accessible via GetValueXXX()
    * @param - value - intmax_t
    * @return  bool  - true if useable value
    */
   bool        AcceptNewValue( intmax_t     value );
   /** 
    * AcceptNewValue - use these functions to apply a 
    * new value to this initializer object, will only
    * accept the proper types and ranges for the type
    * constructed.  If an improper value is supplied
    * as a parameter then a false boolean value will 
    * be returned.  Once this function is called and 
    * true is returned, the correct converted (if
    * necessary) value is accessible via GetValueXXX()
    * @param - value - uintmax_t
    * @return  bool - true if useable value
    */
   bool        AcceptNewValue( uintmax_t    value );
   /** 
    * AcceptNewValue - use these functions to apply a 
    * new value to this initializer object, will only
    * accept the proper types and ranges for the type
    * constructed.  If an improper value is supplied
    * as a parameter then a false boolean value will 
    * be returned.  Once this function is called and 
    * true is returned, the correct converted (if
    * necessary) value is accessible via GetValueXXX()
    * @param - value - bool
    * @return  bool - true if useable value
    */
   bool        AcceptNewValue( bool         value );
   

private:
   std::string string_value;
   intmax_t    int_value;
   uintmax_t   uint_value;
   bool        bool_value;

   enum SetType { STRING, INT, UINT, BOOL, OBJECT };
   SetType     set_type;
};

} /* end namespace Node */

#endif /* END _INITIALIZER_HPP_ */
