/**
 * StreamInput.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 14:40:49 2014
 */
#ifndef _STREAMINPUT_HPP_
#define _STREAMINPUT_HPP_  1
#include <string>
#include "StreamEdges.hpp"

namespace Node {
class StreamInput : public StreamEdges {
public:
   StreamInput();
   virtual ~StreamInput() = default;
protected:
   StreamInput( const std::string name );
};
}
#endif /* END _STREAMINPUT_HPP_ */
