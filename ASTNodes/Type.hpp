/**
 * Type.hpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#ifndef _TYPE_HPP_
#define _TYPE_HPP_  1

#include <cstdint>
#include <string>
#include <ostream>

namespace Node{

class Initializer;

class Type{
public:
   /* constructor */
   Type();
   /* default copy constructor */
   Type( const Type &type );
   /* virtual destructor */
   virtual ~Type();
   
   /**
    * IsType - There will be one virtual IsType method
    * for each primitive type returned by the parser, 
    * the default behavior for Type::IsType( xxx ) is to 
    * return false. Override this behavior in sub-classes
    * for the values that should return true.
    * @param value - uintmax_t
    * @return  bool
    */
   virtual bool IsType( uintmax_t value );
   /**
    * IsType - see above
    * @param   value - long double
    * @param   bool
    */
   virtual bool IsType( long double value );
   /**
    * IsType - see above
    * @param   value - std::string*
    * @return  bool
    */
   virtual bool IsType( std::string *value );
   
   
   /**
    * set_type - give this type some other Type object
    * and it'll take on those characteristics as long
    * as it can, the base class 'Type' only inherits
    * the name itself
    * @param   &type
    */
   virtual void set_type( const Type &type );
   

   /**
    * print - does exactly what it says, give this guy
    * a stream and it'll add a representation of itself
    * to it.
    * @param   stream - std::ostream&
    * @return  std::ostream&
    */
   virtual std::ostream& print( std::ostream &stream );

   virtual std::string ToString();

   virtual Initializer* GetDefaultInitializer() = 0;
protected:
   std::string type_name;

};

} /* end namespace Node */
#endif /* END _TYPE_HPP_ */
