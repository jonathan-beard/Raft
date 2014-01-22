/**
 * StreamEdges.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 14:34:56 2014
 */
#ifndef _STREAMEDGES_HPP_
#define _STREAMEDGES_HPP_  1
#include <string>
#include "NodeAbstract.hpp"

namespace Node{
class StreamEdges : public NodeAbstract {
public:
   StreamEdges();
   virtual ~StreamEdges() = default;
protected:
   StreamEdges( const std::string name );
};
}
#endif /* END _STREAMEDGES_HPP_ */
