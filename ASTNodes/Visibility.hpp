/**
 * Visibility.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 14:06:39 2014
 */
#ifndef _VISIBILITY_HPP_
#define _VISIBILITY_HPP_  1
#include <string>
#include "NodeAbstract.hpp"
namespace Node{
class Visibility : public NodeAbstract {
public:
   virtual ~Visibility() = default;
protected:   
   Visibility( const std::string name );
};
} /** end namespace Node **/
#endif /* END _VISIBILITY_HPP_ */
