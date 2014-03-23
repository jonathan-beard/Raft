/**
 * System.cpp - 
 * @author: Jonathan Beard
 * @version: Sat Jan 25 06:06:30 2014
 */
#include "System.hpp"

using namespace Node;

System::System() : InstantiationModifier( "System" )
{
   class_tree.addRelation( typeid( Node::InstantiationModifier ).hash_code(),
                           typeid( Node::System ).hash_code() );
}
