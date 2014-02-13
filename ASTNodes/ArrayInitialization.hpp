/**
 * ArrayInitialization.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Feb 13 09:01:07 2014
 */
#ifndef _ARRAYINITIALIZATION_HPP_
#define _ARRAYINITIALIZATION_HPP_  1
#include "NodeAbstract.hpp"
#include <string>

namespace Node {
class ArrayInitialization : public NodeAbstract {
public:
   ArrayInitialization();
   virtual ~ArrayInitialization() = default;

protected:
   ArrayInitialization( const std::string name );
};
}
#endif /* END _ARRAYINITIALIZATION_HPP_ */
