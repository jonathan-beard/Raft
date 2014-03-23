/**
 * ArraySlice.cpp - 
 * @author: Jonathan Beard
 * @version: Fri Feb 14 10:32:42 2014
 */
#include "ArraySlice.hpp"
using namespace Node;
ArraySlice::ArraySlice( uint64_t a, uint64_t b ) : NodeAbstract( "ArraySlice" )
{
   class_tree.addRelation( typeid( Node::NodeAbstract ).hash_code(),
                           typeid( Node::ArraySlice ).hash_code() );
   range[0] = a;
   range[1] = b;
}

std::array< uint64_t, 2 >
ArraySlice::get_range()
{
   return( range );
}
