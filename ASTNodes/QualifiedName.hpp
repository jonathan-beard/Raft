/**
 * QualifiedName.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 14:30:10 2013
 */
#ifndef _QUALIFIEDNAME_HPP_
#define _QUALIFIEDNAME_HPP_  1
#include <string>

#include "NodeAbstract.hpp"
namespace Node{
class QualifiedName : public NodeAbstract {
public:
   QualifiedName( const std::string name );
   virtual ~QualifiedName() = default;
};
} /** end namespace Node **/
#endif /* END _QUALIFIEDNAME_HPP_ */
