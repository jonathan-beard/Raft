/**
 * Plus.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Feb 11 12:39:23 2014
 */
#include "Plus.hpp"

using namespace Node;


Plus::Plus() : MathOp( "Plus" )
{
   class_tree.addRelation( typeid( Node::MathOp ).hash_code(),
                           typeid( Node::Plus ).hash_code() );
}
