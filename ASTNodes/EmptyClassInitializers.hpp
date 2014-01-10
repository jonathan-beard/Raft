/**
 * EmptyClassInitializers.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 10 15:48:25 2014
 */
#ifndef _EMPTYCLASSINITIALIZERS_HPP_
#define _EMPTYCLASSINITIALIZERS_HPP_  1
#include "ClassInitializers.hpp"
namespace Node{
class EmptyClassInitializers : public ClassInitializers {
public:
   EmptyClassInitializers();
   virtual ~EmptyClassInitializers() = default;
};
}
#endif /* END _EMPTYCLASSINITIALIZERS_HPP_ */
