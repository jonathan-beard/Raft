/**
 * VarDeclFollows.hpp - 
 * @author: Jonathan Beard
 * @version: Mon Mar 24 12:02:28 2014
 */
#ifndef _VARDECLFOLLOWS_HPP_
#define _VARDECLFOLLOWS_HPP_  1
#include "Follows.hpp"
#include <string>
namespace Node {
class VarDeclFollows : public Follows {
public:
   VarDeclFollows();
   virtual ~VarDeclFollows() = default;
protected:
   VarDeclFollows( const std::string name );
};
}

#endif /* END _VARDECLFOLLOWS_HPP_ */
