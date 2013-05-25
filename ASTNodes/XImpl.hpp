/**
 * XImpl.hpp - 
 * @author: Jonathan Beard
 * @version: Thu Mar 28 11:45:37 2013
 */
#ifndef _XIMPL_HPP_
#define _XIMPL_HPP_  1
namespace X{

enum ImplType { NOTSET, C, C++, Verilog, VHDL, N};

class Impl{
public:
   Impl();
   virtual ~Impl();

   virtual void  set_type( ImplType type );
   virtual ImplType get_type();

   virtual void set_name( std::string name );
   virtual std::string get_name();
protected:
   ImplType type;
   std::string impl_name;
};

} /* end namespace X */
#endif /* END _XIMPL_HPP_ */
