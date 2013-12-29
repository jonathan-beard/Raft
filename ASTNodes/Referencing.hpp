/**
 * Referencing.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 13:00:46 2013
 */
#ifndef _REFERENCING_HPP_
#define _REFERENCING_HPP_  1
#include "NodeAbstract.hpp"
#include <string>
namespace Node{
class Referencing : public NodeAbstract {
public:
   Referencing();
   virtual ~Referencing() = default;
protected:
   Referencing( const std::string name );
};
} /** end namespace Node **/
#endif /* END _REFERENCING_HPP_ */
