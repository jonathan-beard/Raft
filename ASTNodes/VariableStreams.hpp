/**
 * VariableStreams.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 09:41:19 2013
 */
#ifndef _VARIABLESTREAMS_HPP_
#define _VARIABLESTREAMS_HPP_  1
#include "NodeAbstract.hpp"
namespace Node{
class VariableStreams : public NodeAbstract{
public:
   VariableStreams();
   virtual ~VariableStreams() = default;
};
} /** end namespace Node **/
#endif /* END _VARIABLESTREAMS_HPP_ */
