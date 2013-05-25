/**
 * XAsynchDataFlow.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 14:42:11 2013
 */
#include "XDataFlow.hpp"

#ifndef _XASYNCHDATAFLOW_HPP_
#define _XASYNCHDATAFLOW_HPP_  1

namespace X{

class AsynchDataFlow : public DataFlow {
public:
   AsynchDataFlow(size_t min, size_t max);
   virtual ~AsynchDataFlow();
   virtual size_t get_count();
   virtual size_t get_min_count();
   virtual size_t get_max_count();
   virtual std::ostream& print( std::ostream &stream );
   virtual std::string toString();
private:
   size_t my_count;
   size_t my_min;
   size_t my_max;
};
} /* end namespace X */



#endif /* END _XASYNCHDATAFLOW_HPP_ */
