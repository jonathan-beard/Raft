/**
 * Free.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Feb 12 08:27:34 2014
 */
#ifndef _FREE_HPP_
#define _FREE_HPP_  1
#include "NodeAbstract.hpp"

namespace Node {
class Free : public NodeAbstract {
public:
   Free();
   virtual ~Free() = default;
};
}
#endif /* END _FREE_HPP_ */
