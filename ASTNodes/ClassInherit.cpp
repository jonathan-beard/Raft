/**
 * ClassInherit.cpp - 
 * @author: Jonathan Beard
 * @version: Sun Jan 19 08:17:45 2014
 */
#include "ClassInherit.hpp"

using namespace Node;

ClassInherit::ClassInherit() : Inherit( "ClassInherit" )
{
   class_tree.addRelation( typeid( Node::Inherit ).hash_code(),
                           typeid( Node::ClassInherit ).hash_code() );

}

ClassInherit::ClassInherit( const std::string name ) : Inherit( name )
{
   class_tree.addRelation( typeid( Node::Inherit ).hash_code(),
                           typeid( Node::ClassInherit ).hash_code() );
}
