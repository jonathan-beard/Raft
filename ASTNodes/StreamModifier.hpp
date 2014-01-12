/**
 * StreamModifier.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 12 06:44:01 2014
 */
#ifndef _STREAMMODIFIER_HPP_
#define _STREAMMODIFIER_HPP_  1
#include <string>
#include "Modifier.hpp"
namespace Node {
class StreamModifier : public Modifier {
public:
   StreamModifier();
   virtual ~StreamModifier() = default;
protected:
   StreamModifier( const std::string name );
};
}
#endif /* END _STREAMMODIFIER_HPP_ */
