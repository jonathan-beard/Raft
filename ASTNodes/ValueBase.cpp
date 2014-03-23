/**
 * ValueBase.cpp - 
 * @author: Jonathan Beard
 * @version: Tue Dec 10 08:34:09 2013
 */
#include "ValueBase.hpp"

using namespace Node;

ValueBase::ValueBase() : Returns( "ValueBase" )
{
   class_tree.addRelation( typeid( Node::Returns ).hash_code(),
                           typeid( Node::ValueBase ).hash_code() );

}
