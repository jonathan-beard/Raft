/**
 * Modifier.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 12 06:44:01 2014
 */
#ifndef _MODIFIER_HPP_
#define _MODIFIER_HPP_  1
#include <string>
#include "NodeAbstract.hpp"
namespace Node{
class Modifier : public NodeAbstract {
public:
   Modifier();
   virtual ~Modifier() = default;
protected:
   Modifier( const std::string name );
};
}

#endif /* END _MODIFIER_HPP_ */
