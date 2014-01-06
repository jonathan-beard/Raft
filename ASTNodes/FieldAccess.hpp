/**
 * FieldAccess.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 15:35:23 2014
 */
#ifndef _FIELDACCESS_HPP_
#define _FIELDACCESS_HPP_  1
#include <string>
#include "Access.hpp"
namespace Node{
class FieldAccess : public Access {
public:
   FieldAccess( const std::string name );
   virtual ~FieldAccess() = default;
};
} /** end namespace Node **/

#endif /* END _FIELDACCESS_HPP_ */
