/**
 * FindLine.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Mar 30 07:55:15 2014
 */
#ifndef _FINDLINE_HPP_
#define _FINDLINE_HPP_  1
#include <string>

class FindLine {
public:
   FindLine()           = delete;
   virtual ~FindLine()  = delete;

   static std::string findLine( std::string filename, 
                                size_t expected_line, 
                                std::string phrase );
};
#endif /* END _FINDLINE_HPP_ */
