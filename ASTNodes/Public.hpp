/**
 * Public.hpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 14:06:39 2014
 */
#ifndef _PUBLIC_HPP_
#define _PUBLIC_HPP_  1
#include "Visibility.hpp"
namespace Node{
class Public : public Visibility {
public:
   Public();
   virtual ~Public() = default;
};
}
#endif /* END _PUBLIC_HPP_ */
