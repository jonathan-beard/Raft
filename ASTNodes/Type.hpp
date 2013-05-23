/**
 * Type.hpp - 
 * @author: Jonathan Beard
 * @version: Mon May 13 10:43:53 2013
 */
#ifndef _TYPE_HPP_
#define _TYPE_HPP_  1

#include <string>
#include <ostream>

namespace Node{

class Type{
public:
   /* constructor */
   Type();
   /* default copy constructor */
   Type( const Type &type );
   /* virtual destructor */
   virtual ~Type();
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

protected:
   std::string name;

};

} /* end namespace Node */
#endif /* END _TYPE_HPP_ */
