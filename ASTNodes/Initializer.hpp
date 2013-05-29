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

#include "NodeAbstract.hpp"

namespace Node{

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

   std::string GetValue();
   intmax_t    GetValue();
   uintmax_t   GetValue();
   bool        GetValue();

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
