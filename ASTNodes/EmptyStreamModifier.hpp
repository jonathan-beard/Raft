/**
 * EmptyStreamModifier.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 12 07:07:50 2014
 */
#ifndef _EMPTYSTREAMMODIFIER_HPP_
#define _EMPTYSTREAMMODIFIER_HPP_  1
#include "StreamModifier.hpp"
namespace Node {
class EmptyStreamModifier : public StreamModifier {
public:
   EmptyStreamModifier();
   virtual ~EmptyStreamModifier() = default; 
};
}
#endif /* END _EMPTYSTREAMMODIFIER_HPP_ */
