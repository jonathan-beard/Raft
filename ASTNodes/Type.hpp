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

   virtual std::string print( std::ostream &stream );

protected:
   std::string name;

};

} /* end namespace Node */
#endif /* END _TYPE_HPP_ */
