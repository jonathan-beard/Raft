/**
 * VectorType.hpp - 
 * @author: Jonathan Beard
 * @version: Sat May 25 15:24:30 2013
 */
#ifndef _VECTORTYPE_HPP_
#define _VECTORTYPE_HPP_  1

#include "NodeAbstract.hpp"
#include "TypeModifier.hpp"

namespace Node{

class VectorType : public TypeModifier {
public:
   VectorType( size_t size );
   virtual  ~VectorType();


   size_t   get_size();

protected:
   VectorType( const std::string n /* name */,
               size_t s            /* vector size */ );

private:
   size_t   size;
};

} /* end namespace Node */

#endif /* END _VECTORTYPE_HPP_ */
