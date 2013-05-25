/**
 * XKernel.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 09:47:11 2013
 */
#ifndef _XKERNEL_HPP_
#define _XKERNEL_HPP_  1

#include <string>
#include <vector>

#include "XDeclaration.hpp"

//TODO you forgot to distinguish between kernel declaration and 
//kernel instantiation


namespace X{


class Kernel{
public:   
   Kernel();
   virtual ~Kernel();


private:
   std::string kernel_name;
   
   std::vector< X::Declaration > configurations;

   std::vector< X::Port >        input_ports;
   std::vector< X::Port >        output_ports;

   /* pointer to code, initially null */
   std::vector< X::Impl >        implementations;
};

} /* end namespace X */

#endif /* END _X_KERNEL_HPP_ */
