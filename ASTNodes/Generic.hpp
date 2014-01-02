/**
 * Generic.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan  2 15:35:18 2014
 */
#ifndef _GENERIC_HPP_
#define _GENERIC_HPP_  1
#include <string>
#include "NodeAbstract.hpp"

namespace Node{
class Generic : public NodeAbstract {
public:
   Generic();
   virtual ~Generic() = default;
protected:
   Generic( const std::string name );
};
} /** end namespace Node **/
#endif /* END _GENERIC_HPP_ */
