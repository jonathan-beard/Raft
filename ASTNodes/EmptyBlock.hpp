/**
 * EmptyBlock.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Jan 22 14:17:57 2014
 */
#ifndef _EMPTYBLOCK_HPP_
#define _EMPTYBLOCK_HPP_  1
#include "Block.hpp"
namespace Node{
class EmptyBlock : public Block {
public:
   EmptyBlock();
   virtual ~EmptyBlock() = default;
};
}
#endif /* END _EMPTYBLOCK_HPP_ */
