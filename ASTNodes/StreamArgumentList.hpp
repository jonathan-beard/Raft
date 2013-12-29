/**
 * StreamArgumentList.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 13:17:31 2013
 */
#ifndef _STREAMARGUMENTLIST_HPP_
#define _STREAMARGUMENTLIST_HPP_  1
#include "ArgumentList.hpp"
namespace Node{
class StreamArgumentList : public ArgumentList {
public:
   StreamArgumentList();
   virtual ~StreamArgumentList() = default;
protected:  
   StreamArgumentList( const std::string name );
};
} /** end namespace Node **/
#endif /* END _STREAMARGUMENTLIST_HPP_ */
