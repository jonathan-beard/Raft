/**
 * BitOperation.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 16:15:17 2014
 */
#ifndef _BITOPERATION_HPP_
#define _BITOPERATION_HPP_  1
#include "Operation.hpp"
#include <string>
namespace Node {
class BitOperation : public Operation {
public:
   BitOperation();
   virtual ~BitOperation() = default;

protected:
   BitOperation( const std::string name );
};
}
#endif /* END _BITOPERATION_HPP_ */
