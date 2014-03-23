/**
 * Private.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 14:06:39 2014
 */
#include "Private.hpp"

using namespace Node;

Private::Private() : Visibility( "Private" )
{
   class_tree.addRelation( typeid( Node::Visibility ).hash_code(),
                           typeid( Node::Private ).hash_code() );

}
