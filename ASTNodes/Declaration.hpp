/**
 * Declaration.hpp - 
 * @author: Jonathan Beard
 * @version: Wed May 29 08:59:18 2013
 */
#ifndef _DECLARATION_HPP_
#define _DECLARATION_HPP_  1

#include "NodeAbstract.hpp"

namespace Node{

class Declaration : public NodeAbstract {
public:
   Declaration( Type *t, std::string *name, Initializer *init );
   virtual ~Declaration();

   /* TODO add more as we figure out what to add */
};

} /* end namespace Node */

#endif /* END _DECLARATION_HPP_ */
