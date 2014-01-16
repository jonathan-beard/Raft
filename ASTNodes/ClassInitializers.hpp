/**
 * ClassInitializers.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 10 15:48:25 2014
 */
#ifndef _CLASSINITIALIZERS_HPP_
#define _CLASSINITIALIZERS_HPP_  1
#include <string>
#include "NodeAbstract.hpp"
namespace Node{
class ClassInitializers : public Initializer {
public:
   ClassInitializers( const std::string name);
   virtual ~ClassInitializers() = default;
protected:
   ClassInitializers( const std::string name );
};
}
#endif /* END _CLASSINITIALIZERS_HPP_ */
