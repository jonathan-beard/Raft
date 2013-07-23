/**
 * Filename.hpp - 
 * @author: Jonathan Beard
 * @version: Tue Jul 23 10:12:49 2013
 */
#ifndef _FILENAME_HPP_
#define _FILENAME_HPP_  1

#include "NodeAbstract.hpp"

namespace Node{

class Filename : public NodeAbstract{
public:
   Filename( std::string n );
   
   virtual std::ostream& print( std::ostream &stream );
private:
   std::string filename;
};

} /* end namespace Node */

#endif /* END _FILENAME_HPP_ */
