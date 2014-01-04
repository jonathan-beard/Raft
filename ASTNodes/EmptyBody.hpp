/**
 * EmptyBody.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 10:51:37 2014
 */
#ifndef _EMPTYBODY_HPP_
#define _EMPTYBODY_HPP_  1
#include "Body.hpp"
namespace Node{
class EmptyBody : public Body {
public:
   EmptyBody();
   virtual ~EmptyBody() = default;
};
} /** end namespace Node **/
#endif /* END _EMPTYBODY_HPP_ */
