/**
 * EmptyClassInitializer.hpp - 
 * @author: Jonathan Beard
 * @version: Fri Jan 10 15:48:25 2014
 */
#ifndef _EMPTYCLASSINITIALIZER_HPP_
#define _EMPTYCLASSINITIALIZER_HPP_  1
#include "ClassInitializer.hpp"
namespace Node{
class EmptyClassInitializer : public ClassInitializer {
public:
   EmptyClassInitializer();
   virtual ~EmptyClassInitializer() = default;
};
}
#endif /* END _EMPTYCLASSINITIALIZER_HPP_ */
