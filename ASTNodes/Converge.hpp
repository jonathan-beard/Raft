/**
 * Converge.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 12 07:05:04 2014
 */
#ifndef _CONVERGE_HPP_
#define _CONVERGE_HPP_  1
#include "StreamModifier.hpp"
namespace Node {
class Converge : public StreamModifier {
public:
   Converge();
   virtual ~Converge() = default;
};
}
#endif /* END _CONVERGE_HPP_ */
