/**
 * NoStreamOutput.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 14:40:49 2014
 */
#ifndef _NOSTREAMOUTPUT_HPP_
#define _NOSTREAMOUTPUT_HPP_  1
#include "StreamOutput.hpp"

namespace Node {
class NoStreamOutput : public StreamOutput {
public:
   NoStreamOutput();
   virtual ~NoStreamOutput() = default;
};
}
#endif /* END _NOSTREAMOUTPUT_HPP_ */
