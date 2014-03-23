/**
 * MethodReferencing.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 13:00:46 2013
 */
#include "MethodReferencing.hpp"
using namespace Node;

MethodReferencing::MethodReferencing() : 
                                    Referencing( "MethodReferencing" )
{
   class_tree.addRelation( typeid( Node::Referencing ).hash_code(),
                           typeid( Node::MethodReferencing ).hash_code() );
   /** nothing to do here **/
}
