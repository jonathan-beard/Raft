/**
 * Streams.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Apr  8 08:33:58 2014
 */
#ifndef _STREAMS_HPP_
#define _STREAMS_HPP_  1
#include "Modifier.hpp"

namespace Node {
class Streams : public Modifier {
public:
   Streams();
   virtual ~Streams() = default;
};
}
#endif /* END _STREAMS_HPP_ */
