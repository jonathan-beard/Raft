/**
 * XDataFlow.hpp - 
 * @author: Jonathan Beard
 * @version: Wed Mar 27 13:15:17 2013
 */
#include <cstdlib> 
#include <sstream>

#include "NodeAbstract.hpp"

#ifndef _DATAFLOW_HPP_
#define _DATAFLOW_HPP_  1

namespace Node{

class DataFlow : public Type {
public:
   static DataFlow* GetDataFlow( size_t count );
   static DataFlow* GetDataFlow( size_t min,
                                 size_t max );

   virtual ~DataFlow(){};
   bool IsSynchronous();
   virtual size_t get_count() = 0;
   virtual size_t get_min_count() = 0;
   virtual size_t get_max_count() = 0;

   virtual std::ostream& print( std::ostream &stream ) = 0;
   virtual std::string toString() = 0;
protected:
   DataFlow( bool s ) : synchronous( s ){};
private:
   bool synchronous;
};

} /* end namespace X */

#endif /* END _XDATAFLOW_HPP_ */
