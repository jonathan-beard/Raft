/**
 * MethodArgumentList.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 13:17:31 2013
 */
#ifndef _METHODARGUMENTLIST_HPP_
#define _METHODARGUMENTLIST_HPP_  1
#include "ArgumentList.hpp"
namespace Node{
class MethodArgumentList : public ArgumentList {
public:
   MethodArgumentList();
   virtual ~MethodArgumentList() = default;
};
} /** end namespace Node **/
#endif /* END _METHODARGUMENTLIST_HPP_ */
