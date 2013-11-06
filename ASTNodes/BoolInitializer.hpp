/**
 * BoolInitializer.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Sep 28 19:46:20 2013
 */
#ifndef _BOOLINITIALIZER_HPP_
#define _BOOLINITIALIZER_HPP_  1

#include <string>

#include "NodeAbstract.hpp"
namespace Node{
class BoolInitializer : public Initializer {
public:
   BoolInitializer( bool v, const std::string name );
   virtual ~BoolInitializer = default;
};

} /* end namespace Node */
#endif /* END _BOOLINITIALIZER_HPP_ */
