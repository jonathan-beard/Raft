/**
 * AutoType.hpp - This class is only temporary, it should
 * be sub-classed by the auto-type that the actual type should
 * be once it is resolved.  In otherwords, this base version
 * does no type checking on its own.
 *
 * @author: Jonathan Beard
 * @version: Thu Nov 14 15:00:30 2013
 */
#ifndef _AUTOTYPE_HPP_
#define _AUTOTYPE_HPP_  1

#include "Type.hpp"

namespace Node{

class AutomaticType : public Type {
public:
   AutomaticType();
   virtual ~AutomaticType() = default;

   virtual bool IsType( uintmax_t value );
   virtual bool IsType( long double value );
   virtual bool IsType( std::string value );
};

} /* end namespace Node */

#endif /* END _AUTOTYPE_HPP_ */
