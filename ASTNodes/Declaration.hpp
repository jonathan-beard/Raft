/**
 * Declaration.hpp - 
 * @author: Jonathan Beard
 * @version: Wed May 29 08:59:18 2013
 */
#ifndef _DECLARATION_HPP_
#define _DECLARATION_HPP_  1


#include <string>
#include "NodeAbstract.hpp"



namespace Node{

class Declaration : public NodeAbstract {
public:
   Declaration();
   virtual ~Declaration() = default;
protected:
   Declaration( const std::string name );
};

} /* end namespace Node */

#endif /* END _DECLARATION_HPP_ */
