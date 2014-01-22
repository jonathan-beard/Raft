/**
 * NoStreamInput.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 14:40:49 2014
 */
#ifndef _NOSTREAMINPUT_HPP_
#define _NOSTREAMINPUT_HPP_  1
#include "StreamInput.hpp"
namespace Node {
class NoStreamInput : public StreamInput {
public:
   NoStreamInput();
   virtual ~NoStreamInput() = default;
};
}
#endif /* END _NOSTREAMINPUT_HPP_ */
