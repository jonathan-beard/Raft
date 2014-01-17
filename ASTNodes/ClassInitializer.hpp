/**
 * ClassInitializer.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 10 15:48:25 2014
 */
#ifndef _CLASSINITIALIZER_HPP_
#define _CLASSINITIALIZER_HPP_  1
#include <string>
#include "Initializer.hpp"

namespace Node{
class ClassInitializer : public Initializer {
public:
   ClassInitializer( const std::string name);
   virtual ~ClassInitializer() = default;
};
}
#endif /* END _CLASSINITIALIZER_HPP_ */
