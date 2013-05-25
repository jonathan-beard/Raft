/**
 * XSynchDataFlow.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 14:42:11 2013
 */

#include "XDataFlow.hpp"

#ifndef _XSYNCHDATAFLOW_HPP_
#define _XSYNCHDATAFLOW_HPP_  1

namespace X{

class SynchDataFlow : public DataFlow {
public:
   SynchDataFlow(size_t count);
   virtual ~SynchDataFlow();
   virtual size_t get_count();
   virtual size_t get_min_count();
   virtual size_t get_max_count();

   virtual std::ostream& print( std::ostream &stream );
   virtual std::string toString();
private:
   size_t my_count;
};
} /* end namespace X */

#endif /* END _XSYNCHDATAFLOW_HPP_ */
