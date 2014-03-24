/**
 * Follows.hpp - 
 * @author: Jonathan Beard
 * @version: Mon Mar 24 12:21:22 2014
 */
#ifndef _FOLLOWS_HPP_
#define _FOLLOWS_HPP_  1
#include "NodeAbstract.hpp"
#include <string>

namespace Node{
class Follows : public NodeAbstract {
public:
   Follows();
   virtual ~Follows() = default;

protected:
   Follows( const std::string name );
};
}
#endif /* END _FOLLOWS_HPP_ */
