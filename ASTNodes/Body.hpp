/**
 * Body.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 10:51:37 2014
 */
#ifndef _BODY_HPP_
#define _BODY_HPP_  1
#include <string>
#include "NodeAbstract.hpp"
namespace Node{
class Body : public NodeAbstract {
public:
   Body();
   virtual ~Body() = default;
protected:
   Body( const std::string name );
};
} /** end namespace Node **/
#endif /* END _BODY_HPP_ */
