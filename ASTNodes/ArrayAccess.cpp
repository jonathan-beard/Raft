/**
 * ArrayAccess.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 15:35:23 2014
 */
#include "ArrayAccess.hpp"
using namespace Node;
ArrayAccess::ArrayAccess() : Access( "ArrayAccess" )
{
   class_tree.addRelation( typeid( Node::Access ).hash_code(),
                           typeid( Node::ArrayAccess ).hash_code() );

}
