/**
 * Inherit.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan  3 16:13:49 2014
 */
#ifndef _INHERIT_HPP_
#define _INHERIT_HPP_  1
#include <string>
#include "NodeAbstract.hpp"
using namespace Node{
class Inherit : public NodeAbstract {
public:
   Inherit();
   virtual ~Inherit() = default;
protected:
   Inherit( const std::string name );
};
} /** end namespace Node **/
#endif /* END _INHERIT_HPP_ */
