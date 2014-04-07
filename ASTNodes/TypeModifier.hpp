/**
 * TypeModifier.hpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 15:51:44 2013
 */
#ifndef _TYPEMODIFIER_HPP_
#define _TYPEMODIFIER_HPP_  1

#include "NodeAbstract.hpp"

namespace Node{

class TypeModifier : public NodeAbstract {
public:
   TypeModifier();
   virtual ~TypeModifier();
   
protected:
   TypeModifier( const std::string n );
};

} /* end namespace Node */

#endif /* END _TYPEMODIFIER_HPP_ */
