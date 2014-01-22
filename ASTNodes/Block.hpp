/**
 * Block.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 10:45:25 2014
 */
#ifndef _BLOCK_HPP_
#define _BLOCK_HPP_  1
#include <string>
#include "NodeAbstract.hpp"

namespace Node{
class Block : public NodeAbstract {
public:
   Block();
   virtual ~Block() = default;
protected:
   Block( const std::string name );
};
}
#endif /* END _BLOCK_HPP_ */
