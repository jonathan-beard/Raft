/**
 * Interface.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 10:47:23 2014
 */
#ifndef _INTERFACE_HPP_
#define _INTERFACE_HPP_  1
#include <string>
#include "NodeAbstract.hpp"
namespace Node{
class Interface : public NodeAbstract {
public:
   Interface( const std::string name );
   virtual ~Interface() = default;
};
} /** end namespace Node **/
#endif /* END _INTERFACE_HPP_ */
