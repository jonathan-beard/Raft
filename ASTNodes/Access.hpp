/**
 * Access.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 15:35:23 2014
 */
#ifndef _ACCESS_HPP_
#define _ACCESS_HPP_  1
#include <string>
#include "Returns.hpp"

namespace Node {
class Access : public Returns {
public:
   Access();
   virtual ~Access() = default;
protected:
   Access( const std::string name );
};
}
#endif /* END _ACCESS_HPP_ */
