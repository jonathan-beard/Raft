/**
 * Fork.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 12 07:05:04 2014
 */
#ifndef _FORK_HPP_
#define _FORK_HPP_  1
#include "StreamModifier.hpp"
namespace Node {
class Fork : public StreamModifier {
public:
   Fork();
   virtual ~Fork() = default; 
};
}
#endif /* END _FORK_HPP_ */
