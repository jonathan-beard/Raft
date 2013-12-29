/**
 * StreamOption.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Dec 28 16:34:15 2013
 */
#ifndef _STREAMOPTION_HPP_
#define _STREAMOPTION_HPP_  1
#include "NodeAbstract.hpp"
namespace Node{
class StreamOption : public NodeAbstract {
public:
   StreamOption();
   virtual ~StreamOption() = default;
};
} /** end namespace Node **/
#endif /* END _STREAMOPTION_HPP_ */
