/**
 * LOROp.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:51:41 2014
 */
#include "LOROp.hpp"

using namespace Node;

LOROp::LOROp() : CondOp( "LOROp" )
{
   class_tree.addRelation( typeid( Node::CondOp ).hash_code(),
                           typeid( Node::LOROp ).hash_code() );
}
