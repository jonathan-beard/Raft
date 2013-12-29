/**
 * MethodReferencing.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 13:00:46 2013
 */
#ifndef _METHODREFERENCING_HPP_
#define _METHODREFERENCING_HPP_  1

#include "Referencing.hpp"

namespace Node{
class MethodReferencing : public Referencing {
public:
   MethodReferencing();
   virtual ~MethodReferencing() = default;
};
} /** end namespace Node **/
#endif /* END _METHODREFERENCING_HPP_ */
