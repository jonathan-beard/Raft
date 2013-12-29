/**
 * StreamReferencing.hpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 13:00:46 2013
 */
#ifndef _STREAMREFERENCING_HPP_
#define _STREAMREFERENCING_HPP_  1

#include "Referencing.hpp"

namespace Node{
class StreamReferencing : public Referencing {
public:
   StreamReferencing();
   virtual ~StreamReferencing() = default;
};
} /** end namespace Node **/
#endif /* END _STREAMREFERENCING_HPP_ */
