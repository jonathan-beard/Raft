/**
 * VariableReferencing.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 13:00:46 2013
 */
#ifndef _VARIABLEREFERENCING_HPP_
#define _VARIABLEREFERENCING_HPP_  1

#include "Referencing.hpp"
namespace Node{
class VariableReferencing : public Referencing {
public:
   VariableReferencing();
   virtual ~VariableReferencing() = default;
};
} /** end namespace Node **/
#endif /* END _VARIABLEREFERENCING_HPP_ */
