/**
 * Returns.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 13:15:48 2013
 */
#ifndef _RETURNS_HPP_
#define _RETURNS_HPP_  1
#include "NodeAbstract.hpp"
namespace Node{
class Returns : public NodeAbstract{
public:
   Returns();
   virtual ~Returns() = default;
protected:
   Returns( const std::string name );
};
} /* end namespace Node */
#endif /* END _RETURNS_HPP_ */
