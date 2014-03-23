/**
 * LANDOp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "LANDOp.hpp"

using namespace Node;

LANDOp::LANDOp() : CondOp( "LANDOp" )
{
   class_tree.addRelation( typeid( Node::CondOp ).hash_code(),
                           typeid( Node::LANDOp ).hash_code() );
}
