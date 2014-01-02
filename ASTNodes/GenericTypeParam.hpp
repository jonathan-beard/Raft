/**
 * GenericTypeParam.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Jan  2 15:35:18 2014
 */
#ifndef _GENERICTYPEPARAM_HPP_
#define _GENERICTYPEPARAM_HPP_  1
#include <string>
#include "Generic.hpp"
namespace Node{
class GenericTypeParam : public Generic {
public:
   GenericTypeParam( const std::string name );
   virtual ~GenericTypeParam() = default;
};
} /** end namespace Node **/
#endif /* END _GENERICTYPEPARAM_HPP_ */
