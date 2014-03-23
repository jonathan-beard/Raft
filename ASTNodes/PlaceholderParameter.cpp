/**
 * PlaceholderParameter.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan  5 13:05:30 2014
 */
#include "PlaceholderParameter.hpp"

using namespace Node;

PlaceholderParameter::PlaceholderParameter() : Parameter( "Placeholder" )
{
   class_tree.addRelation( typeid( Node::Parameter ).hash_code(),
                           typeid( Node::PlaceholderParameter ).hash_code() );

}
