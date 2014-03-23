/**
 * FieldAccess.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan  4 15:35:23 2014
 */
#include "FieldAccess.hpp"

using namespace Node;

FieldAccess::FieldAccess( const std::string name ) : Access( name )
{
   class_tree.addRelation( typeid( Node::Access ).hash_code(),
                           typeid( Node::FieldAccess ).hash_code() );

}
