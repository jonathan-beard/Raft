/**
 * Value.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Nov  6 15:04:46 2013
 */
#ifndef _VALUE_HPP_
#define _VALUE_HPP_  1

namespace Node {
class Value : public NodeAbstract {
public:
   Value() = default; 
   virtual ~Value() = default;

   /* get_value - a call to this function copies
    * this Value object's value to the memory located
    * at protoValue which has allocated nbytes.  If 
    * not enough bytes were allocated the function will
    * attempt to assign as much as possible then 
    * return false.
    * @param   protoValue - char *
    * @param   nbytes - size_t
    * @return  bool - true if call succeeds
    */
   bool get_value( char *protoValue, size_t nbytes ) = 0;
};

} /* end namespace Node */

#endif /* END _VALUE_HPP_ */
