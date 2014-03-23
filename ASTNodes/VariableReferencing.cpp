/**
 * VariableReferencing.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Dec 29 13:00:46 2013
 */
#include "VariableReferencing.hpp"

using namespace Node;

VariableReferencing::VariableReferencing() : 
                                 Referencing( "VariableReferencing" )
{
   class_tree.addRelation( typeid( Node::Referencing ).hash_code(),
                           typeid( Node::VariableReferencing ).hash_code() );
   /** nothing to do here **/
}
