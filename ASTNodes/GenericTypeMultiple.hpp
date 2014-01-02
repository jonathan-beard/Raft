/**
 * GenericTypeMultiple.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan  2 15:49:24 2014
 */
#ifndef _GENERICTYPEMULTIPLE_HPP_
#define _GENERICTYPEMULTIPLE_HPP_  1
#include "Generic.hpp"
namespace Node{
class GenericTypeMultiple : public Generic {
public:
   GenericTypeMultiple();
   virtual ~GenericTypeMultiple() = default;
};
} /** end namespace Node **/
#endif /* END _GENERICTYPEMULTIPLE_HPP_ */
