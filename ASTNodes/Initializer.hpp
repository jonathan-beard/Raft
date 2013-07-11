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

class Initializer : public NodeAbstract{
public:
   Initializer();
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
    * Convert - used to convert the value at 
    * str to the type of value that this
    * initializer accepts.  Throw an exception
    * if it cannot be converted.  Once the 
    * value is converted it will be assigned
    * as the current value of this initializer.
    * @param   str - std::string*
    * @throws  ConversionException
    */
   void        Convert( std::string *str ) throws(ConversionException);

   std::string GetValueString();
   intmax_t    GetValueInt();
   uintmax_t   GetValueUInt();
   bool        GetValueBool();

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
