/**
 * StreamOutput.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 14:40:49 2014
 */
#ifndef _STREAMOUTPUT_HPP_
#define _STREAMOUTPUT_HPP_  1
#include <string>
#include "StreamEdges.hpp"

namespace Node{
class StreamOutput : public StreamEdges {
public:
   StreamOutput();
   virtual ~StreamOutput() = default;
protected:
   StreamOutput( const std::string name );
};
}
#endif /* END _STREAMOUTPUT_HPP_ */
