/**
 * Initializer.hpp - 
 * @author: Jonathan Beard
 * @version: Wed May 29 15:12:21 2013
 */
#ifndef _INITIALIZER_HPP_
#define _INITIALIZER_HPP_  1
#include <string>
#include "NodeAbstract.hpp"

namespace Node{
class Initializer : public NodeAbstract{
public:
   Initializer();
   virtual ~Initializer() = default;
protected:
   Initializer( const std::string name );
};

} /* end namespace Node */

#endif /* END _INITIALIZER_HPP_ */
